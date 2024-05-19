import { Parents } from '@/app/_1_pages'

interface pageProps {
  params: { locale: string; req: any }
}

const page: React.FC<pageProps> = async ({ params }) => {
  return <Parents locale={params.locale} />
}

export default page
