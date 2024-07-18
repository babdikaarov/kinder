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
    // CMS_API: 'http://localhost:1337/cms',

    //  // local dev //
    BASE_URL: 'http://localhost:3000',
    BACKEND_URL: 'https://kashkaldak.edu.kg',
    CMS_API: 'http://localhost:1337/cms',

    // docker dev //
    // BASE_URL: 'http://localhost',
    // BACKEND_URL: 'https://kashkaldak.edu.kg',
    // CMS_API: 'http://strapi:1337/cms',
  },
  output: 'standalone',
  reactStrictMode: false,
  images: {
    deviceSizes: [390, 640, 750, 828, 1080, 1200, 1920],
    remotePatterns: [
      {
        protocol: 'http',
        hostname: 'strapi',
        // hostname: 'host.docker.internal', // docker development, cms running locally
        port: '1337',
      },
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '1337',
      },
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '3000',
      },
    ],
  },
}

export default withNextIntl()(nextConfig)
