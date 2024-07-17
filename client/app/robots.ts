import { MetadataRoute } from 'next'

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: '*',
      allow: '/',
      disallow: ['/admin', '/admin/', '/admin-docs'],
    },
    sitemap: ['https://kashkaldak.edu.kg/sitemap.xml'],
  }
}
