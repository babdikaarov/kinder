import { NextPage } from 'next'
import dynamic from 'next/dynamic'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Админ',
  description:
    'Детский Сад Кашкалдак - административная панель для обработки документов одобренных заявлений',
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
