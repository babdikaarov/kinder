// @ts-check
import withNextIntl from 'next-intl/plugin'
/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  env: {
    BACKEND_URL: 'https://kashkaldak.edu.kg',
    CMS_API: 'http://localhost:1337',
  },
  output: 'standalone',
  reactStrictMode: false,
  images: {
    deviceSizes: [390, 640, 750, 828, 1080, 1200, 1920],
    remotePatterns: [
      {
        protocol: 'http',
        // change it on production to cms url
        hostname: 'localhost',
        port: '1337',
      },
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '3000',
      },
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '8080',
      },
    ],
  },
}

export default withNextIntl()(nextConfig)
