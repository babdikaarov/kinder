import { getData } from '@entities/index'
import { Wrapper, bgColor, cn } from '@shared/index'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'

interface GroupsProps extends myTS.I {}

const Groups: React.FC<GroupsProps> = async ({ locale }) => {
  const t = await getTranslations()

  const data = await getData('/cms/api/group-categories?&populate=*')

  return (
    <Wrapper header={t('home_ourGroups_header')} id='home_our_groups'>
      <article className='mt-12 flex justify-center gap-5 smExtra:flex-col smExtra:items-center'>
        {data.map((item: any, index: number) => (
          <div
            key={item[locale].id}
            className=' relative flex h-[395px] w-full max-w-[392px] items-end lg:h-[350px]  sm:h-[370px] '
          >
            <div className='absolute bottom-[95px] left-1/2 aspect-square w-full max-w-[300px] -translate-x-1/2 lg:max-w-[260px] lg:p-5 md:bottom-[140px] smExtra:bottom-[80px] '>
              <Image
                className=' object-cover'
                src={item.image.src}
                alt={item[locale].title ?? 'group icon'}
                width={300}
                height={300}
                style={{
                  width: 'auto',
                  height: 'auto',
                  objectFit: 'cover',
                }}
              />
            </div>
            <div
              className={cn(
                ' flex h-[195px] min-w-full max-w-[392px] flex-col justify-end rounded-10 px-6 py-7'
              )}
              style={{ background: bgColor[index] }}
            >
              <h4 className='text-fs-6 text-dark-800'>
                {item[locale].category}
              </h4>
              <p className='text-fs-lg text-dark-200'>{item[locale].age}</p>
              <p className='text-fs-lg text-dark-200'>
                {item[locale].language}
              </p>
            </div>
          </div>
        ))}
      </article>
    </Wrapper>
  )
}

export default Groups
