import { getTranslations } from 'next-intl/server'
import GalleryClient from './GalleryClient'
import { Arrow } from '@shared/index'
import { Metadata } from 'next'
export interface ImageFormat {
  src: string
  width: number
  height: number
}

export interface ImageData {
  id: number
  alt: string | null
  src: string
  formats: {
    large: ImageFormat
    small: ImageFormat
    medium: ImageFormat
    thumbnail: ImageFormat
  }
}

export interface DataEntry {
  data: ImageData[]
}

export const metadata: Metadata = {
  title: 'Галерея',
  description: 'Галерея фотографий Кашкалдак',
}
interface pageProps {
  params: { locale: string }
}

const page: React.FC<pageProps> = async ({ params }) => {
  const t = await getTranslations()
  const url = process.env.CMS_API + '/cms/api/galleries?&populate=*'
  const response = await fetch(url, { cache: 'no-cache' })
  if (!response.ok) throw Error('server is not responding')
  const data = (await response.json()) as DataEntry[]
  const flatData: ImageData[] = data.map((el) => el.data).flat()
  return (
    <main className='relative  mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col items-center justify-between gap-32 font-poppins'>
      <Arrow
        className='absolute left-0 top-3'
        href='/'
        locale={params.locale}
      />
      <GalleryClient data={flatData} header={t('gallery_header')} />
    </main>
  )
}

export default page
