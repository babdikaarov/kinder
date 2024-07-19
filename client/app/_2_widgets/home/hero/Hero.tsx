import { getData } from '@entities/index'
import { Wrapper, cn, ArrowAnimated } from '@shared/index'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'

interface HeroProps extends myTS.I {}

const Hero: React.FC<HeroProps> = async ({ locale }) => {
  const { title, description, image, link } = await getData(
    '/api/hero?populate=*'
  )
  const t = await getTranslations()

  return (
    <Wrapper
      className={`relative flex  w-full max-w-wrapperLimit items-center justify-center gap-5 px-4 py-20 smExtra:h-[390px] smExtra:w-svw smExtra:py-10`}
    >
      <Image
        className='absolute size-full object-cover brightness-50'
        src={image.src}
        alt={title ?? 'hero background'}
        width={1200}
        height={530}
        style={{
          width: 'auto',
          height: 'auto',
          objectFit: 'cover',
        }}
        priority
      />
      <article className='z-10 flex max-w-[700px] flex-col items-center justify-between gap-4 text-center font-poppins text-white'>
        <h1 className=' font-poppins text-fs-1 font-semibold smExtra:text-fs-4'>
          {title}
        </h1>
        <div className='text-center'>
          <p className='text-fs-lg'>{description[locale]}</p>
        </div>
        <a
          href={link}
          target='_blank'
          className='button group mt-4 flex h-[62px] w-full max-w-[400px] items-center justify-center gap-1'
        >
          <button className='text-fs-lg  text-white'>
            {t('home_hero_button')}
          </button>
          <ArrowAnimated
            className={cn(
              'w-0 transition-all duration-200 ease-linear ',
              'group-hover:relative group-hover:w-8'
            )}
          />
        </a>
      </article>
    </Wrapper>
  )
}

export default Hero
