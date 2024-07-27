// @ts-check
import withNextIntl from 'next-intl/plugin'
/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  productionBrowserSourceMaps: false,
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
    // CMS_API: 'https://kashkaldak.edu.kg',
    // BASE_URL: 'https://kashkaldak.edu.kg',
    // BASE_URL_PUBLIC: 'https://kashkaldak.edu.kg',
    // BACKEND_URL_PUBLIC: 'https://kashkaldak.edu.kg',
    // CMS_API_PUBLIC: 'https://kashkaldak.edu.kg',
  },
  images: {
    deviceSizes: [390, 640, 750, 828, 1080, 1200, 1920],
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**',
      },
      {
        protocol: 'http',
        hostname: '**',
      },
      {
        protocol: 'https',
        hostname: '**',
        port: '**',
      },
      {
        protocol: 'http',
        hostname: '**',
        port: '**',
      },
    ],
  },
}

export default withNextIntl()(nextConfig)
