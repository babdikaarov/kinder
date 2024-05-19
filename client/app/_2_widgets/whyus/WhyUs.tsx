import { getData } from '@entities/index'
import { Wrapper, bgColor } from '@shared/index'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'

interface WhyUsProps extends myTS.I {}

const WhyUs: React.FC<WhyUsProps> = async ({ i }) => {
  const t = await getTranslations('homePage.whyus')
  const data = await getData('/api/why-uses?&populate=*')

  return (
    <Wrapper header={t('header')} id='home_whyus'>
      <article className='mt-12 flex justify-center gap-5 smExtra:flex-col smExtra:items-center'>
        {data.map((item: any, index: number) => (
          <div
            key={item.id}
            className=' relative flex h-[395px] w-full max-w-[392px] items-end  sm:h-[370px] '
          >
            <div className='absolute bottom-[95px] left-1/2 aspect-square w-full  -translate-x-1/2 p-5 smExtra:bottom-[35px]    smExtra:p-10'>
              <Image
                className='object-cover'
                src={item.image.src}
                alt={item[i].title ?? 'image'}
                width={300}
                height={300}
              />
            </div>
            <div
              className='flex h-[195px] min-w-full max-w-[392px] flex-col justify-end rounded-10 px-6 py-7              '
              style={{ background: bgColor[index] }}
            >
              <p className=' text-center  text-fs-6 font-semibold text-dark-800'>
                {item[i].title}
              </p>
            </div>
          </div>
        ))}
      </article>
    </Wrapper>
  )
}

export default WhyUs
