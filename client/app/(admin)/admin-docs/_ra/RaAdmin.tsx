'use client'
import {
  Admin,
  AppBar,
  Layout,
  ListButton,
  Loading,
  LoadingIndicator,
  LocalesMenuButton,
  Logout,
  RefreshButton,
  resolveBrowserLocale,
  Resource,
  TitlePortal,
  ToggleThemeButton,
  Toolbar,
  useLocaleState,
  UserMenu,
} from 'react-admin'
import polyglotI18nProvider from 'ra-i18n-polyglot'
import ruMessages from './locale/russian'
// import enMessages from './locale/english'
import kyMessages from './locale/kyrgyz'
import authProvider from './authProvider'
import dataProvider from './dataProvider'
import { FormList } from './resources/FormList'
import { FormEdit } from './resources/FormEdit'
import { useState } from 'react'
import Image from 'next/image'
const translations = { ky: kyMessages, ru: ruMessages } as any
// const translations = { ky: kyMessages, ru: ruMessages, en: enMessages } as any

export const i18nProvider = polyglotI18nProvider(
  (locale) => {
    return translations[locale]
  },
  'ru',
  [
    { locale: 'ky', name: '' },
    { locale: 'ru', name: '' },
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

const MyLayout = ({ children }: any) => {
  const [locale] = useLocaleState()
  return (
    <Layout
      menu={() => <></>}
      sidebar={() => <></>}
      sx={{ '& .RaAppBar-menuButton': { display: 'none' } }}
      appBar={() => (
        <AppBar
          userMenu={
            <>
              <LocalesMenuButton
                icon={
                  locale !== 'ru' ? (
                    <Image
                      src='/kgflag.webp'
                      width={180}
                      height={120}
                      alt=''
                      className='h-4 w-6'
                    />
                  ) : (
                    <Image
                      src='/ruflag.webp'
                      width={24}
                      height={16}
                      alt=''
                      className='h-4 w-6'
                    />
                  )
                }
                languages={[
                  { locale: 'ky', name: 'кыргызча' },
                  { locale: 'ru', name: 'орусча' },
                ]}
              />
              <LoadingIndicator />
              <ToggleThemeButton />
              <UserMenu />
            </>
          }
          toolbar={<></>}
        ></AppBar>
      )}
    >
      {children}
    </Layout>
  )
}
