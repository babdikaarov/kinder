import createMiddleware from 'next-intl/middleware'
import { localePrefix, locales } from './navigation'

export default createMiddleware({
  locales,
  localePrefix,
  defaultLocale: 'ky',
})

// only applies this middleware to files in the app directory
export const config = {
  matcher: ['/((?!api|cms|_next|.*\\..*).*)'],
}
