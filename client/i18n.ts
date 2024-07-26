import { notFound } from 'next/navigation'
import { getRequestConfig } from 'next-intl/server'
import { redirect } from 'next/navigation'
import { getData } from '@entities/index'
// Can be imported from a shared config
const locales = ['ky', 'ru']

export default getRequestConfig(async ({ locale }) => {
  if (!locales.includes(locale as any)) notFound()

  try {
    const response = await getData(`/cms/api/language?locale=${locale}`)
    return { messages: response.attributes }
  } catch (error) {
    // console.log(error)
    redirect('/404')
  }
})
