import { getTranslations } from 'next-intl/server'
import GalleryClient from './GalleryClient'
import { Arrow } from '@shared/index'
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

interface GalleryServerProps {}

const GalleryServer: React.FC<GalleryServerProps> = async ({}) => {
  const t = await getTranslations('gallery')
  const url = process.env.CMS_API + '/api/galleries?&populate=*'
  const response = await fetch(url, { cache: 'no-cache' })
  if (!response.ok) throw Error('server is not responding')
  const data = (await response.json()) as DataEntry[]

  return (
    <main className='font-poppins relative mb-32 mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col items-center justify-between gap-32'>
      <Arrow className='absolute left-0' tomain />
      <GalleryClient data={data} header={t('header')} />
    </main>
  )
}

export default GalleryServer
