// @ts-ignore
// @ts-check
import withNextIntl from 'next-intl/plugin'
/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  output: 'standalone',
  /* config options here */

  reactStrictMode: false,
  // i18n,
  images: {
    deviceSizes: [390, 640, 750, 828, 1080, 1200, 1920],
    remotePatterns: [
      {
        protocol: 'http',
        hostname: process.env.CMS_HOST || 'localhost',
        port: process.env.CMS_PORT || '1337',
      },
      {
        protocol: 'http',
        hostname: process.env.HOST || 'localhost',
        port: process.env.PORT || '3000',
      },
    ],
  },
  // async redirects() {
  //   return [
  //     // Basic redirect
  //     {
  //       source: '/cms',
  //       destination: 'http://localhost:1337/admin',
  //       permanent: true,
  //     },
  //   ]
  // },
}

export default withNextIntl()(nextConfig)
