import type { Metadata } from 'next'
import { Poppins } from 'next/font/google'
import '../globals.css'
import { Footer, Header } from '@/app/_2_widgets'
import Link from 'next/link'

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
        <div className='fixed left-[30%] top-8 z-[999] flex gap-3 bg-green-500'>
          <Link
            href='/admin-docs'
            // target='_blank'
            className='bg-blue-900 text-white'
          >
            to admin
          </Link>
        </div>
        <Header i={locale} />
        {children}
        <Footer i={locale} />
      </body>
    </html>
  )
}
