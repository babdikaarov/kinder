import BlogModal from '@/app/_2_widgets/blog/BlogModal'
import { getData } from '@/app/_4_entities'
import { getTranslations } from 'next-intl/server';

interface PageProps {
  params: { locale: string; id: string }
}

const Page: React.FC<PageProps> = async ({ params }) => {
  const { id, locale } = params
  const data = await getData('/api/blogs?&populate=*')
  const index = data.findIndex((post: { id: number }) => post.id === Number(id))
  if (!data[index][locale].post) return null
  const post = data[index]
  const shareT = await getTranslations('shareLink')
  const shareText = {
    share: shareT('share'),
    copy: shareT('copy'),
    copied: shareT('copied'),
  }
  return <BlogModal shareText={shareText} content={post} locale={locale} />
}

export default Page
