// @ts-check
import withNextIntl from 'next-intl/plugin'
/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
  output: 'standalone',
  reactStrictMode: false,
  env: {
    BACKEND_URL_PUBLIC: process.env.BACKEND_URL_PUBLIC,
    CMS_API_PUBLIC: process.env.CMS_API_PUBLIC,
  },
  images: {
    deviceSizes: [390, 640, 750, 828, 1080, 1200, 1920],
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'kashkaldak.edu.kg',
      },
      {
        protocol: 'http',
        hostname: 'kashkaldak.edu.kg',
      },
      {
        protocol: 'http',
        hostname: 'localhost',
      },
      {
        protocol: 'http',
        hostname: 'nginx',
      },
    ],
  },
}

export default withNextIntl()(nextConfig)
