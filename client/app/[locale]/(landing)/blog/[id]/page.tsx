import { Blog } from '@widgets/index'
import { getData } from '@entities/index'
import { getTranslations } from 'next-intl/server'
import { Metadata } from 'next'
import { notFound } from 'next/navigation'

interface PageProps {
  params: { id: string; locale: string }
}

export async function generateMetadata({
  params,
}: {
  params: {
    id: string
    locale: string
  }
}): Promise<Metadata | undefined> {
  const data = await getData('/api/blogs?&populate=*', { cache: 'default' })

  if (!data) {
    return
  }
  const index = data.findIndex(
    (arr: { id: number }) => arr.id === Number(params.id)
  )

  const post = data[index]
  return {
    title: post[params.locale].title,
    description: `Читать ${post[params.locale].title} статью от Кашкалдак`,
    openGraph: {
      title: post[params.locale].title,
      description: `Читать ${post[params.locale].title} статью от Кашкалдак`,
      url: `${process.env.BASE_URL}/ru/blog/${params.id}`,
      siteName: 'Кашкалдак',
      images: [
        {
          url: post.image.src,
          width: 1200,
          height: 600,
        },
      ],
      locale: 'ru',
      type: 'article',
    },

    twitter: {
      card: 'summary_large_image',
      title: post[params.locale].title,
      description: `Читать ${post[params.locale].title} статью от Кашкалдак`,
      creator: 'Кашкалдак',
      images: [`${process.env.BASE_URL}/twitter-image.png`], // Must be an absolute URL
    },
  }
}

const Page: React.FC<PageProps> = async ({ params }) => {
  const { id, locale } = params
  const data = await getData('/api/blogs?&populate=*')

  if (!data) {
    notFound()
  }
  const index = data.findIndex((arr: { id: number }) => arr.id === Number(id))

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

  return (
    <main className='relative  mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col items-center justify-between gap-32 '>
      <Blog shareText={shareText} content={post} locale={locale} />
    </main>
  )
}

export default Page
