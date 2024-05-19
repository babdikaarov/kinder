import { getData } from '@/app/_4_entities'
import { Arrow, Wrapper, cn } from '@shared/index'
import { BlocksContent } from '@strapi/blocks-react-renderer'
import { Share2 } from 'lucide-react'
import { getTranslations } from 'next-intl/server'
import Image from 'next/image'
import { Link } from '@/navigation'
import ShareLinks from '../../_5_shared/Links/ShareLinks'

interface ParentsProps {
  locale: string
}
type TData = {
  id: number
  ky: { title: string; post: BlocksContent }
  ru: { title: string; post: BlocksContent }
  image: any
}
const Parents: React.FC<ParentsProps> = async ({ locale }) => {
  const t = await getTranslations('parents')
  const shareT = await getTranslations('shareLink')
  const data = await getData('/api/blogs?&populate=*')

  const shareText = {
    share: shareT('share'),
    copy: shareT('copy'),
    copied: shareT('copied'),
  }
  return (
    <>
      <Arrow className='absolute left-0' tomain />
      <Wrapper header={t('header')} id='parents' className='w-full'>
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
                // FIX_ME add bluer placeholder https://market.strapi.io/plugins/strapi-plugin-placeholder
                // placeholder='blur'
                // blurDataURL={}
                className='size-full max-h-[413px] rounded-10 bg-gray-300 object-cover'
              />
              <h4 className='text-fs-lg capitalize text-dark-800'>
                {el[locale as myTS.L].title}
              </h4>
              <div className='relative flex items-center justify-between'>
                <Link href={`/blog/${el.id}`} locale={locale} scroll={false}>
                  <button className='button h-11 w-52 rounded-lg text-fs-base'>
                    {t('button')}
                  </button>
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
  // return <CalendarServer />
}

export default Parents
