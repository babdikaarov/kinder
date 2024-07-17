import type { Metadata } from 'next'
import { Footer, Header } from '@widgets/index'

export default function RootLocaleLayout({
  children,
  params: { locale },
}: {
  children: React.ReactNode
  params: { locale: string }
}) {
  return (
    <div className='font-monserat m-auto flex  min-h-svh min-w-full max-w-wrapperLimit flex-col items-center justify-between  gap-32 bg-theme-bg px-5'>
      <Header locale={locale} />
      {children}
      <Footer locale={locale} />
    </div>
  )
}
