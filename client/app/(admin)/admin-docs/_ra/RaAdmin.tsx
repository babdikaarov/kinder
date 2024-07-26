'use client'
import { Admin, Layout, resolveBrowserLocale, Resource } from 'react-admin'
import polyglotI18nProvider from 'ra-i18n-polyglot'
import ruMessages from './locale/russian'
// import enMessages from './locale/english'
import kyMessages from './locale/kyrgyz'
import authProvider from './authProvider'
import dataProvider from './dataProvider'
import { FormList } from './resources/FormList'
import { FormEdit } from './resources/FormEdit'
const translations = { ky: kyMessages, ru: ruMessages } as any
// const translations = { ky: kyMessages, ru: ruMessages, en: enMessages } as any

export const i18nProvider = polyglotI18nProvider(
  (locale) => {
    return translations[locale]
  },
  'ru',
  [
    { locale: 'ky', name: 'Кыргызча' },
    { locale: 'ru', name: 'Русский' },
    // { locale: 'en', name: 'English' },
  ]
)

interface RaAdminProps {}

const RaAdmin: React.FC<RaAdminProps> = ({}) => {
  return (
    <Admin
      dataProvider={dataProvider(`${process.env.BACKEND_URL_PUBLIC}/api`)}
      i18nProvider={i18nProvider}
      authProvider={authProvider}
      defaultTheme='light'
      title='My Custom Admin'
      layout={MyLayout}
      requireAuth
      disableTelemetry
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
