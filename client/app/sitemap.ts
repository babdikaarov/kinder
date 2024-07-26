import { MetadataRoute } from 'next'
// import { getData } from '@entities/index'

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const staticMap = [
    {
      url: `${process.env.BASE_URL}`,
      lastModified: new Date(),
      alternates: {
        languages: {
          ky: `${process.env.BASE_URL}/ky`,
          ru: `${process.env.BASE_URL}/ru`,
        },
      },
    },
    {
      url: `${process.env.BASE_URL}/#about`,
      lastModified: new Date(),
      alternates: {
        languages: {
          ky: `${process.env.BASE_URL}/ky/#about`,
          ru: `${process.env.BASE_URL}/ru/#about`,
        },
      },
    },
    {
      url: `${process.env.BASE_URL}/send-docs`,
      lastModified: new Date(),
      alternates: {
        languages: {
          ky: `${process.env.BASE_URL}/ky/send-docs`,
          ru: `${process.env.BASE_URL}/ru/send-docs`,
        },
      },
    },
    {
      url: `${process.env.BASE_URL}/parent`,
      lastModified: new Date(),
      alternates: {
        languages: {
          ky: `${process.env.BASE_URL}/ky/parent`,
          ru: `${process.env.BASE_URL}/ru/parent`,
        },
      },
    },
    {
      url: `${process.env.BASE_URL}/gallery`,
      lastModified: new Date(),
      alternates: {
        languages: {
          ky: `${process.env.BASE_URL}/ky/gallery`,
          ru: `${process.env.BASE_URL}/ru/gallery`,
        },
      },
    },
  ]

  const url = `${process.env.CMS_API}/cms/api/blogs?&populate=*`

  let posts: any[] = []

  try {
    const response = await fetch(url, { next: { revalidate: 86400 } })
    const data = await response.json()
    posts = data ?? []
  } catch (error) {
    console.error('Failed to fetch blog posts:', error)
    posts = []
  }

  const dynamicMap = posts.map((blog) => ({
    url: `${process.env.BASE_URL}/blog/${blog.id}`,
    lastModified: new Date(),
    alternates: {
      languages: {
        ky: `${process.env.BASE_URL}/ky/blog/${blog.id}`,
        ru: `${process.env.BASE_URL}/ru/blog/${blog.id}`,
      },
    },
  }))

  return [...staticMap, ...dynamicMap]
}
