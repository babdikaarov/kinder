import { AdminPage } from '@/app/_1_pages'

interface pageProps {
  params: { locale: string; id: string }
}

const page: React.FC<pageProps> = ({ params }) => {
  return <AdminPage i={params.locale} />
}

export default page
