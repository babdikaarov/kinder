import { getData } from '@entities/index'
import { Wrapper, cn } from '@shared/index'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'

interface ProgramsProps extends myTS.I {}

const Programs: React.FC<ProgramsProps> = async ({ i }) => {
  const t = await getTranslations()

  // const text = await getData('/api/program-description?populate=*')
  const data = await getData('/api/home-program-items?&populate=*')

  return (
    <Wrapper header={t('home_programs_header')} id='home_programs'>
      <div
        className={cn(
          'lg:before:z-20',
          'lg:after:z-20',
          'relative lg:before:absolute  lg:before:right-0 lg:before:top-0 lg:before:h-full lg:before:w-5 lg:before:bg-gradient-to-r lg:before:from-neutral-50 lg:before:to-gray-400 lg:before:opacity-45',
          'relative lg:after:absolute lg:after:left-0 lg:after:top-0 lg:after:h-full lg:after:w-5 lg:after:bg-gradient-to-l lg:after:from-neutral-50 lg:after:to-gray-400 lg:after:opacity-45'
        )}
      >
        <div
          id='elementScroll'
          className={cn(
            'overflow-y-hidden overflow-x-scroll',
            'flex w-full justify-center gap-10  lg:justify-start',
            'mt-12 gap-5 gap-x-16 gap-y-10 text-center'
          )}
        >
          {data.map((item: any, index: number) => (
            <article
              about={item[i].title}
              key={index}
              className={cn(' text-center')}
            >
              <details>
                <summary>
                  <Image
                    className='aspect-square min-w-[200px] max-w-[200px]'
                    src={item.image.src}
                    alt={item.title ?? 'program icon'}
                    width={200}
                    height={200}
                    style={{
                      width: 'auto',
                      height: 'auto',
                      objectFit: 'cover',
                    }}
                  />
                  <p className='text-fs-lg font-semibold'>{item[i].title}</p>
                </summary>
                <p className='relative z-10  max-w-[200px]  rounded-10 border border-black bg-blue-500 p-1 text-fs-base  tracking-wide text-white '>
                  {item[i].description}
                </p>
              </details>
            </article>
          ))}
        </div>
      </div>
    </Wrapper>
  )
}

export default Programs
