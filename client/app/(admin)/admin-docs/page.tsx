import { NextPage } from 'next'
import dynamic from 'next/dynamic'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Кашкалдак | Админ панель для администрации',
  description:
    'Простмотр и загрузка документов отправленных через сайт kashkaldak.edu.kg',
  generator: 'Next.js',
  applicationName: 'Кашкалдак',
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
  creator: 'kashkaldak.edu.kg',
  publisher: '@babdikaarov',
  formatDetection: {
    email: false,
    address: true,
    telephone: true,
  },
  openGraph: {
    title: 'Кашкалдак | Админ панель для администрации',
    description:
      'Простмотр и загрузка документов отправленных через сайт kashkaldak.edu.kg',
    url: `${process.env.BASE_URL_PUBLIC}/admin-docs`,
    siteName: 'Кашкалдак',
    images: [
      {
        url: `${process.env.BASE_URL_PUBLIC}/opengraph-image.png`, // Must be an absolute URL
        width: 800,
        height: 600,
      },
    ],
    locale: 'ru',
    type: 'website',
  },

  icons: {
    icon: `${process.env.BASE_URL_PUBLIC}/icon-manifest.png`,
    shortcut: `${process.env.BASE_URL_PUBLIC}/shortcut-icon.png`,
    apple: `${process.env.BASE_URL_PUBLIC}/apple-icon.png`,
    other: {
      rel: 'apple-touch-icon-precomposed',
      url: `${process.env.BASE_URL_PUBLIC}/apple-touch-icon-precomposed.png`,
    },
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Кашкалдак | Админ панель для администрации',
    description:
      'Простмотр и загрузка документов отправленных через сайт kashkaldak.edu.kg',
    creator: 'Кашкалдак',
    images: [`${process.env.BASE_URL_PUBLIC}/twitter-image.png`], // Must be an absolute URL
  },
}

const RaAdmin = dynamic(() => import('./_ra/RaAdmin'), {
  ssr: false,
})

const Home: NextPage = async () => (
  <div className='m-0'>
    <RaAdmin />
  </div>
)

export default Home
