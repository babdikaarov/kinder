import { getData } from '@entities/index'
import { Wrapper, bgColor } from '@shared/index'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'

interface WhyUsProps extends myTS.I {}

const WhyUs: React.FC<WhyUsProps> = async ({ locale }) => {
  const t = await getTranslations()
  const data = await getData('/api/why-uses?&populate=*')

  return (
    <Wrapper header={t('home_why_us_header')} id='home_whyus'>
      <article className='mt-12 flex justify-center gap-5 smExtra:flex-col smExtra:items-center'>
        {data.map((item: any, index: number) => (
          <div
            key={item.id}
            className=' relative flex h-[395px] w-full max-w-[392px] items-end lg:h-[350px]  sm:h-[370px] '
          >
            <div className='absolute bottom-[95px] left-1/2 aspect-square w-full max-w-[300px] -translate-x-1/2 lg:max-w-[260px] lg:p-5 md:bottom-[140px] smExtra:bottom-[80px] '>
              <Image
                className='object-cover'
                src={item.image.src}
                alt={item[locale].title ?? 'image'}
                width={300}
                height={300}
              />
            </div>
            <div
              className='flex h-[195px] min-w-full max-w-[392px] flex-col justify-end rounded-10 px-6 py-7              '
              style={{ background: bgColor[index] }}
            >
              <p className=' text-center  text-fs-6 font-semibold text-dark-800'>
                {item[locale].title}
              </p>
            </div>
          </div>
        ))}
      </article>
    </Wrapper>
  )
}

export default WhyUs
