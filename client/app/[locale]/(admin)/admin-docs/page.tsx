import { NextPage } from 'next'
import dynamic from 'next/dynamic'
const RaAdmin = dynamic(() => import('./_ra/RaAdmin'), {
  ssr: false,
})

const Home: NextPage = async () => <RaAdmin />

export default Home
