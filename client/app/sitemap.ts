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

  const url = process.env.CMS_API + '/api/blogs?&populate=*'

  let post = []
  try {
    const response = await fetch(url, { next: { revalidate: 86400 } })
    if (response.ok) {
      const data = await response.json()
      post = data
    } else {
      console.error('Fetch failed with status:', response.status)
    }
  } catch (error) {
    console.error('Fetch failed with error:', error)
  }

  return [
    ...staticMap,
    ...post
      .map((blog: { id: any }) => {
        if (!blog.id) return undefined
        return {
          url: `${process.env.BASE_URL}/blog/${blog.id}`,
          lastModified: new Date(),
          alternates: {
            languages: {
              ky: `${process.env.BASE_URL}/ky/blog/${blog.id}`,
              ru: `${process.env.BASE_URL}/ru/blog/${blog.id}`,
            },
          },
        }
      })
      .filter((el: undefined) => el !== undefined),
  ]
}
