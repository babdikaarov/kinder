import { MetadataRoute } from 'next'

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: '*',
      allow: '/',
      disallow: ['/admin', '/cms'],
    },
    sitemap: ['https://kashkaldak.edu.kg/sitemap.xml'],
  }
}
