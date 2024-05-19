import { getData } from '@entities/index'
import { Wrapper, bgColor, cn } from '@shared/index'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'

interface GroupsProps extends myTS.I {}

const Groups: React.FC<GroupsProps> = async ({ i }) => {
  const t = await getTranslations('homePage.ourGroups')

  const data = await getData('/api/group-categories?&populate=*')

  return (
    <Wrapper header={t('header')} id='home_our_groups'>
      <article className='mt-12 flex justify-center gap-5 smExtra:flex-col smExtra:items-center'>
        {data.map((item: any, index: number) => (
          <div
            key={item[i].id}
            className=' relative flex h-[395px] w-full max-w-[392px] items-end  sm:h-[370px] '
          >
            <div className='absolute bottom-[95px] left-1/2 aspect-square w-full -translate-x-1/2  p-5 md:bottom-[140px] smExtra:bottom-[35px]    smExtra:p-10'>
              <Image
                className=' object-cover'
                src={item.image.src}
                alt={item[i].title ?? 'group icon'}
                width={300}
                height={300}
              />
            </div>
            <div
              className={cn(
                ' flex h-[195px] min-w-full max-w-[392px] flex-col justify-end rounded-10 px-6 py-7'
              )}
              style={{ background: bgColor[index] }}
            >
              <h4 className='text-fs-6 text-dark-800'>{item[i].category}</h4>
              <p className='text-fs-lg text-dark-200'>{item[i].age}</p>
              <p className='text-fs-lg text-dark-200'>{item[i].language}</p>
            </div>
          </div>
        ))}
      </article>
    </Wrapper>
  )
}

export default Groups
