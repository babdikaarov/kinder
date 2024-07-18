import { getData } from '@entities/index'
import { Arrow, Wrapper, cn, ShareLinks, ArrowAnimated } from '@shared/index'
import { BlocksContent } from '@strapi/blocks-react-renderer'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'
import { Link } from '@/navigation'
import { Metadata } from 'next'

type TData = {
  id: number
  ky: { title: string; post: BlocksContent }
  ru: { title: string; post: BlocksContent }
  image: any
}
interface pageProps {
  params: { locale: string; req: any }
}

export const metadata: Metadata = {
  title: 'Статьи для родителей',
  description: 'Информация и полезные статьи для родителей',
}

const page: React.FC<pageProps> = async ({ params }) => {
  const { locale } = params
  const t = await getTranslations()
  const data = await getData('/api/blogs?&populate=*')

  const shareText = {
    share: t('share_link_share'),
    copy: t('share_link_copy'),
    copied: t('share_link_copied'),
  }
  return (
    <>
      <Arrow className='absolute left-0 top-3' href='/' locale={locale} />
      <Wrapper header={t('parent_header')} id='parents' className='w-full'>
        <div
          className={cn(
            'mt-12 grid grid-cols-3 gap-x-5 gap-y-11',
            'mdExtra:grid-cols-2',
            'smExtra:grid-cols-1'
          )}
        >
          {data.map((el: TData) => (
            <article
              key={el.id}
              className='flex h-[523px] w-full flex-col justify-between '
            >
              <Image
                src={el.image.src}
                alt={el[locale as myTS.L].title ?? 'image blog'}
                width={390}
                height={413}
                style={{
                  width: 'auto',
                  height: 'auto',
                  objectFit: 'cover',
                }}
                className='size-full max-h-[413px] rounded-10 bg-gray-300 object-cover'
              />
              <h4 className='text-fs-lg capitalize text-dark-800'>
                {el[locale as myTS.L].title}
              </h4>
              <div className='relative flex items-center justify-between'>
                <Link
                  href={`/blog/${el.id}`}
                  locale={locale}
                  scroll={false}
                  className='button group flex h-11 w-52 items-center justify-center gap-1 rounded-lg text-fs-base '
                >
                  <button>{t('parents_button')}</button>
                  <ArrowAnimated
                    className={cn(
                      'w-0 transition-all duration-200 ease-linear ',
                      'group-hover:relative group-hover:w-8'
                    )}
                  />
                </Link>
                <ShareLinks
                  text={shareText}
                  id={el.id}
                  title={el[locale as myTS.L].title}
                  locale={locale}
                />
              </div>
            </article>
          ))}
        </div>
      </Wrapper>
    </>
  )
}

export default page
