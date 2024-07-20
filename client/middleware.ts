import createMiddleware from 'next-intl/middleware'
import { localePrefix, locales } from './navigation'
import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

const intlMiddleware = createMiddleware({
  locales,
  localePrefix,
  defaultLocale: 'ky',
})
// Define the middleware
export function middleware(request: NextRequest) {
  // Apply the intlMiddleware
  const response = intlMiddleware(request)

  // If intlMiddleware returns a response, return it
  const path = request.nextUrl.pathname
  if (
    path.startsWith('/ru/admin-docs') ||
    path.startsWith('/ky/admin-docs') ||
    path.includes('admin-docs')
  ) {
    return NextResponse.redirect(new URL('/admin-docs', request.url))
  }
  if (
    path.startsWith('/ru/admin') ||
    path.startsWith('/ky/admin') ||
    (path.includes('admin') && !path.includes('admin-docs'))
  ) {
    return NextResponse.redirect(
      new URL(`${process.env.BASE_URL}/admin`, request.url)
    )
  }
  if (response) {
    return response
  }

  return NextResponse.next()
}

export const config = {
  matcher: ['/((?!api|cms|_next|admin|.*\\..*).*)'],
}
// '/((?!i18n|content-manager|uploads|upload|content-type-builder|email|users-permissions|.*\\..*).*)',
