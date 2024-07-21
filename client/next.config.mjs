// @ts-check
import withNextIntl from 'next-intl/plugin'
/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  env: {
    // // prod //
    // BASE_URL: 'https://kashkaldak.edu.kg',
    // BACKEND_URL: 'https://kashkaldak.edu.kg',
    // CMS_API: 'http://kashkaldak.edu.kg:1337/cms',

    //  // local dev //
    // BASE_URL: 'http://localhost:3001',
    // BACKEND_URL: 'https://kashkaldak.edu.kg',
    // CMS_API: 'http://localhost/cms',

    // // docker dev //
    BASE_URL: 'http://localhost',
    BACKEND_URL: 'http://nginx',
    CMS_API: 'http://nginx/cms',
  },
  output: 'standalone',
  reactStrictMode: false,
  images: {
    deviceSizes: [390, 640, 750, 828, 1080, 1200, 1920],
    remotePatterns: [
      // {
      //   protocol: 'http',
      //   hostname: 'strapi',
      //   port: '1337',
      // },
      // {
      //   protocol: 'http',
      //   hostname: 'localhost',
      //   port: '1337',
      // },
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '3000',
      },
      {
        protocol: 'http',
        hostname: 'localhost',
      },
      {
        protocol: 'http',
        hostname: 'nginx',
        port: '80',
      },
      {
        protocol: 'http',
        hostname: 'nginx',
      },
    ],
  },
}

export default withNextIntl()(nextConfig)
