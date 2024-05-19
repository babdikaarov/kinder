// import CalendarClient from './CalendarClient'
import { Arrow, Wrapper, cn, seedRecurrence } from '@/app/_5_shared'
import { XScheduler } from '@widgets/index'
import { getTranslations } from 'next-intl/server'
import { ClassNameValue } from 'tailwind-merge'

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

interface CalendarProps extends myTS.I {}

const Calendar: React.FC<CalendarProps> = async ({ i }) => {
  const url = process.env.CMS_API + '/api/calendars'
  const response = await fetch(url, { cache: 'no-cache' })
  if (!response.ok) throw Error('server is not responding')
  const { data, category } = await response.json()
  console.log(data)

  const seedData = data
    .map((el: TData) => (el.rrule ? seedRecurrence(el) : el))
    .flat()

  const t = await getTranslations('calendar')
  const text = {
    header: t('header'),
    label: t('label'),
    filter: t('filter'),
  }
  return (
    <main className='mb-32 mt-24 flex w-full flex-1 items-center justify-center font-poppins'>
      <Wrapper className='relative w-full' header={text.header}>
        <Arrow tomain className='absolute top-0' />
        <XScheduler data={seedData} category={category} i={i} text={text} />
      </Wrapper>
    </main>
  )
}

export default Calendar
