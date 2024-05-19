import { Wrapper, cn } from '@shared/index'
import { getData } from '@entities/index'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'
import { Link } from '@/navigation'

interface GalleryInfoProps extends myTS.I {}

const GalleryInfo: React.FC<GalleryInfoProps> = async ({ i }) => {
  const t = await getTranslations('homePage.galleryInfo')

  const data = await getData('/api/home-gallery-info?populate=*')
  return (
    <Wrapper className='flex items-center justify-center gap-5 smExtra:flex-col'>
      <article
        className={cn('flex flex-1 flex-col items-center', 'lg:flex-[1.2]')}
      >
        <h2 className=' text-center font-poppins text-fs-1 font-bold  '>
          {t('header')}
        </h2>
        <p className='mt-6 text-fs-lg lg:text-center'>{data[i].description}</p>
        <Link href={`/gallery`} locale={i} className='mt-9' prefetch>
          <button className='button h-[62px] w-[269px] text-fs-lg '>
            {t('button')}
          </button>
        </Link>
      </article>
      <div className='flex-1'>
        <Image
          className='object-cover'
          // className='lg:h-[210px] lg:w-[400px]'
          src={data.image.src}
          alt={data.image.alt ?? 'gallery refference'}
          width={600}
          height={300}
        />
      </div>
    </Wrapper>
  )
}

export default GalleryInfo
