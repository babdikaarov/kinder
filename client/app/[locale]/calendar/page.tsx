import { Calendar } from '@/app/_1_pages'

interface pageProps {
  params: {locale: string}
}

const page: React.FC<pageProps> = ({params}) => {
  return <Calendar i={params.locale} />
}

export default page
