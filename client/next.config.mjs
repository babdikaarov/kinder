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
        hostname: '16.170.170.229',
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
