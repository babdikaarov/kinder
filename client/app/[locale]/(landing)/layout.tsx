import type { Metadata } from 'next'
import { Poppins } from 'next/font/google'
import '../globals.css'
import { Footer, Header } from '@/app/_2_widgets'

export const metadata: Metadata = {
  title: 'Kindergarten',
  description: 'on development',
}

const poppins = Poppins({
  weight: '400',
  subsets: ['latin'],
  variable: '--font-poppins',
  style: 'normal',
  display: 'swap',
})

export default function RootLocaleLayout({
  children,
  params: { locale },
}: {
  children: React.ReactNode
  params: { locale: string }
}) {
  return (
    <html lang={locale} className={poppins.variable}>
      <body className='font-monserat m-auto flex  min-h-svh min-w-full max-w-wrapperLimit flex-col items-center justify-between  gap-32 bg-theme-bg px-5'>
        <Header locale={locale} />
        {children}
        <Footer locale={locale} />
      </body>
    </html>
  )
}
