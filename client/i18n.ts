import { notFound } from 'next/navigation'
import { getRequestConfig } from 'next-intl/server'
import { redirect } from 'next/navigation'
// Can be imported from a shared config
const locales = ['ky', 'ru']
const cache: Record<string, any> = {}

export default getRequestConfig(async ({ locale }) => {
  // Validate that the incoming `locale` parameter is valid
  if (!locales.includes(locale as any)) notFound()

  // Check if the response is already cached
  if (cache[locale]) {
    return cache[locale]
  }
  try {
    const response = await fetch(`${process.env.CMS_API}/api/lang`)

    const { data } = await response.json()
    cache[locale] = {
      messages: data.attributes[locale],
    }
    return cache[locale]
  } catch (error) {
    console.log(error)
    redirect('/404')
  }
})
