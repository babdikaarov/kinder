import { Calendar } from '@/app/_1_pages'
// import CalendarClient from './CalendarClient'
import { Arrow, Wrapper, cn, seedRecurrence } from '@/app/_5_shared'
import { XScheduler } from '@widgets/index'
import { getTranslations } from 'next-intl/server'
import { ClassNameValue } from 'tailwind-merge'
import { string } from 'zod'

export type TData = {
  id: string
  title?: string
  start: string
  end: string
  calendarId: string
  description?: string
  location?: string
  rrule: string
}
interface pageProps {
  params: { locale: string }
}

const page: React.FC<pageProps> = async ({ params }) => {
  const { locale } = params
  const url = process.env.CMS_API + `/api/calendars?locale=${locale}`
  const response = await fetch(url, { cache: 'no-cache' })
  if (!response.ok) throw Error('server is not responding')
  const { data, category } = await response.json()
  const seedData = data
    .map((el: TData) => (el.rrule ? seedRecurrence(el) : el))
    .flat()

  const t = await getTranslations()
  const text = {
    header: t('calendar_header'),
    label: t('calendar_label'),
    filter: t('calendar_filter'),
  }

  return (
    <main className=' mt-24 flex w-full flex-1 items-center justify-center font-poppins'>
      <Wrapper className='relative w-full' header={text.header}>
        <Arrow tomain className='absolute top-0' />
        <XScheduler
          data={seedData}
          category={category}
          locale={locale}
          text={text}
        />
      </Wrapper>
    </main>
  )
}

export default page
