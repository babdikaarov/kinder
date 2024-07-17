import { Wrapper, cn, ArrowAnimated } from '@shared/index'
import { getData } from '@entities/index'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'
import { Link } from '@/navigation'

interface GalleryInfoProps extends myTS.I {}

const GalleryInfo: React.FC<GalleryInfoProps> = async ({ locale }) => {
  const t = await getTranslations()

  const data = await getData('/api/home-gallery-info?populate=*')
  return (
    <Wrapper className='flex items-center justify-center gap-5 smExtra:flex-col'>
      <article
        className={cn('flex flex-1 flex-col items-center', 'lg:flex-[1.2]')}
      >
        <h2 className=' text-center font-poppins text-fs-1 font-bold  '>
          {t('home_galleryInfo_header')}
        </h2>
        <p className='mt-6 text-fs-lg lg:text-center'>
          {data[locale].description}
        </p>
        <Link
          href={`/gallery`}
          locale={locale}
          className='button group mt-9 flex h-[62px] w-[269px] items-center justify-center gap-1 text-fs-lg'
          prefetch
        >
          <button>{t('home_galleryInfo_button')}</button>
          <ArrowAnimated
            className={cn(
              'w-0 transition-all duration-200 ease-linear ',
              'group-hover:relative group-hover:w-8'
            )}
          />
        </Link>
      </article>
      <div className='flex-1'>
        <Image
          className='object-cover'
          src={data.image.src}
          alt={data.image.alt ?? 'gallery refference'}
          width={600}
          height={300}
          style={{
            width: 'auto',
            height: 'auto',
            objectFit: 'cover',
          }}
        />
      </div>
    </Wrapper>
  )
}

export default GalleryInfo
