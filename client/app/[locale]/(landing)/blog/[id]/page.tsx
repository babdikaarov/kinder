import { Blog } from '@/app/_2_widgets'
import { getData } from '@/app/_4_entities'
import { getTranslations } from 'next-intl/server'

interface PageProps {
  params: { id: string; locale: string }
}

const Page: React.FC<PageProps> = async ({ params }) => {
  const { id, locale } = params
  const data = await getData('/api/blogs?&populate=*')
  const index = data.findIndex((arr: { id: number }) => arr.id === Number(id))

  if (!data[index]) return null
  const post = data[index]

  const shareT = await getTranslations()
  const shareText = {
    share: shareT('share_link_share'),
    copy: shareT('share_link_copy'),
    copied: shareT('share_link_copied'),
  }

  return (
    <main className='relative  mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col items-center justify-between gap-32 '>
      <Blog shareText={shareText} content={post} locale={locale} />
    </main>
  )
}

export default Page
