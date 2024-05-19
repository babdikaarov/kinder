import type { InferGetServerSidePropsType, GetServerSideProps } from 'next'
import { HomePage } from '@pages/index'

interface PageProps {
  params: { locale: string }
}

const Page: React.FC<PageProps> = ({ params }) => {
  return <HomePage i={params.locale} />
}

export default Page
