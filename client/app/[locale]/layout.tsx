import type { Metadata } from 'next'
import { Poppins } from 'next/font/google'
import './globals.css'
import { Footer, Header } from '@/app/_2_widgets'
import Link from 'next/link'
import ScreenSizeDisplay from '../_6_lib/media'

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
      <body className='font-monserat m-auto  flex min-h-svh min-w-full max-w-wrapperLimit flex-col items-center  justify-between gap-32 bg-theme-bg  px-5 '>
        <Link
          href='/admin'
          target='_blank'
          className=' fixed left-0 top-52 bg-green-500'
        >
          to CMS
        </Link>
        <ScreenSizeDisplay />
        <Header i={locale} />
        {children}
        <Footer i={locale} />
      </body>
    </html>
  )
}
