import type { Metadata } from 'next'
import { Poppins } from 'next/font/google'
import '../globals.css'

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
      <body className='m-0'>{children}</body>
    </html>
  )
}
