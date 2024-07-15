import { Wrapper, cn } from '@shared/index'
import { getData } from '@entities/index'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'

interface AboutProps extends myTS.I {}

const About: React.FC<AboutProps> = async ({ locale }) => {
  const t = await getTranslations()
  const data = await getData('/api/abouts?&populate=*')

  return (
    <Wrapper header={t('home_about_header')} id='about'>
      <article className='mt-12 flex flex-wrap justify-center gap-8'>
        {data.map((item: any, index: number) => (
          <div
            key={item.id}
            className={cn(
              `flex items-center ${index % 2 === 0 ? 'flex-row' : 'flex-row-reverse'} gap-2`,
              'mdExtra:flex-col'
            )}
          >
            <Image
              src={item.image.src}
              alt={item.image.alt ?? 'Image describing featuring about us'}
              width={630}
              height={420}
              className={cn(
                'aspect-video w-full max-w-[630px]',
                'lg:max-w-[500px]'
              )}
              style={{
                width: 'auto',
                // height: 'auto',
                objectFit: 'cover',
              }}
            />
            <p
              className={cn(
                'flex-1  text-fs-lg leading-7',
                'mdExtra:max-w-[500px]'
              )}
            >
              {item.description[locale]}
            </p>
          </div>
        ))}
      </article>
    </Wrapper>
  )
}

export default About
