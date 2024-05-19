// @ts-check
// import pkg from './next-i18next.config.js'
// const { i18n } = pkg
import withNextIntl from 'next-intl/plugin'
/** @type {import('next').NextConfig} */
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
        port: '1337',
      },
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '3000',
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
