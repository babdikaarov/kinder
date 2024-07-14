'use client' // remove this line if you choose Pages Router
import {
  Admin,
  Layout,
  Resource,
  AppBar,
  LocalesMenuButton,
  ToggleThemeButton,
  LoadingIndicator,
} from 'react-admin'
import polyglotI18nProvider from 'ra-i18n-polyglot'
import ruMessages from 'ra-language-russian'
import enMessages from 'ra-language-english'
import kyMessages from './kyrgyz'
import authProvider from './authProvider'
import dataProvider from './dataProvider'
import { FormList } from './form/FormList'
import { FormShow } from './form/show'
import { FormEdit } from './form/edit'
const translations = { ky: kyMessages, ru: ruMessages, en: enMessages } as any

export const i18nProvider = polyglotI18nProvider(
  (locale) => (translations[locale] ? translations[locale] : translations.ru),
  translations.ru,
  [
    { locale: 'ky', name: 'Кыргызча' },
    { locale: 'ru', name: 'Русский' },
    { locale: 'en', name: 'English' },
  ]
)

interface RaAdminProps {}

const RaAdmin: React.FC<RaAdminProps> = ({}) => {
  return (
    <Admin
      dataProvider={dataProvider(`${process.env.BACKEND_URL}/api`)}
      i18nProvider={i18nProvider}
      authProvider={authProvider}
      defaultTheme='light'
      title='My Custom Admin'
      layout={MyLayout}
    >
      <Resource
        name='form'
        list={FormList}
        edit={FormEdit}
        recordRepresentation='name'
      />
    </Admin>
  )
}

export default RaAdmin

const MyLayout = ({ children }: any) => (
  <Layout
    menu={() => <></>}
    sidebar={() => <></>}
    sx={{ '& .RaAppBar-menuButton': { display: 'none' } }}
  >
    {children}
  </Layout>
)
