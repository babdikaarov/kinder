import type { Metadata } from 'next'
import { Poppins } from 'next/font/google'
import './globals.css'

export const metadata: Metadata = {
  metadataBase: new URL(`${process.env.BASE_URL}`),
  title: {
    default: 'Кашкалдак  Детский сад им. Азима Нарматова',
    template: '%s | Кашкалдак  Детский сад им. Азима Нарматова',
  },
  description:
    'Дошкольное образовательное учреждение Кашкалдак им. Азима Нарматова - местонахождение Ноокатский район, государственное детское воспитательное учреждение. Сайт для ознакомления с учреждение и отправики запрошенных документов для родителей детей зачисленных в детский сад',
  generator: 'Next.js',
  applicationName: 'Кашкалдак',
  keywords: [
    'Дошкольное',
    'Образование',
    'Ноокатский',
    'Район',
    'Детский',
    'Сад',
    'Встать',
    'Очередь',
    'Лучший',
    'Воспитание',
    'Дети',
  ],
  authors: [
    {
      name: 'Aiperi Akylbekova',
      url: 'linkedin.com/in/aiperi-akylbekova-7316ab286',
    },
    { name: 'Kanykei Amatova', url: 'www.linkedin.com/in/kanykei-amatova' },
    {
      name: 'Akylbek Bolsunbekov',
      url: 'www.linkedin.com/in/akylbek-bolsunbekov',
    },
    { name: 'Beksultan Abdikaarov', url: 'www.linkedin.com/in/babdikaarov' },
  ],
  creator: 'Kanykei',
  publisher: '@babdikaarov',
  formatDetection: {
    email: false,
    address: true,
    telephone: true,
  },
  openGraph: {
    title: 'Кашкалдак | Детский сад им. Азима Нарматова',
    description:
      'Дошкольное образовательное учреждение Кашкалдак им. Азима Нарматова - местонахождение Ноокатский район, государственное детское воспитательное учреждение. Сайт для ознакомления с учреждение и отправики запрошенных документов для родителей детей зачисленных в детский сад',
    url: `${process.env.BASE_URL}`,
    siteName: 'Кашкалдак',
    images: [
      {
        url: `${process.env.BASE_URL}/opengraph-image.png`, // Must be an absolute URL
        width: 800,
        height: 600,
      },
    ],
    locale: 'ru',
    type: 'website',
  },

  icons: {
    icon: `${process.env.BASE_URL}/icon-manifest.png`,
    shortcut: `${process.env.BASE_URL}/shortcut-icon.png`,
    apple: `${process.env.BASE_URL}/apple-icon.png`,
    other: {
      rel: 'apple-touch-icon-precomposed',
      url: `${process.env.BASE_URL}/apple-touch-icon-precomposed.png`,
    },
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Кашкалдак | Детский сад им. Азима Нарматова',
    description:
      'Дошкольное образовательное учреждение Кашкалдак им. Азима Нарматова - местонахождение Ноокатский район, государственное детское воспитательное учреждение. Сайт для ознакомления с учреждение и отправики запрошенных документов для родителей детей зачисленных в детский сад',
    creator: 'Кашкалдак',
    images: [`${process.env.BASE_URL}/twitter-image.png`], // Must be an absolute URL
  },
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
      <body>{children}</body>
    </html>
  )
}
