import { BlogModal } from '@widgets/index'
import { getData } from '@entities/index'
import { getTranslations } from 'next-intl/server'
import { notFound } from 'next/navigation'

interface PageProps {
  params: { locale: string; id: string }
}

const Page: React.FC<PageProps> = async ({ params }) => {
  const { id, locale } = params
  const data = await getData('/cms/api/blogs?&populate=*')
  if (!data) {
    notFound()
  }

  const index = data.findIndex((post: { id: number }) => post.id === Number(id))
  if (!data[index]) {
    notFound()
  }
  const post = data[index]
  const shareT = await getTranslations()
  const shareText = {
    share: shareT('share_link_share'),
    copy: shareT('share_link_copy'),
    copied: shareT('share_link_copied'),
  }

  return <BlogModal shareText={shareText} content={post} locale={locale} />
}

export default Page
