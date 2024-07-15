'use client'

import { useNextCalendarApp, ScheduleXCalendar } from '@lib/schedulerX/index'
import {
  viewWeek,
  viewDay,
  viewMonthGrid,
  viewMonthAgenda,
} from '@babdikaarov/calendar'
import { createEventModalPlugin } from '@babdikaarov/event-modal'
import '@babdikaarov/theme-default/dist/index.css'
import { generateEventColorTheme } from './calendarsConfig'
import { useEffect, useState } from 'react'
import { TData } from '../../_1_pages/calendar/Calendar'
import FilterArea from './FilterArea'
import './calendar.css'
interface XSchedulerProps extends myTS.I {
  data: TData[]
  category: string[]
  text: {
    header: string
    label: string
    filter: string
  }
}

const XScheduler: React.FC<XSchedulerProps> = ({
  data,
  category,
  text,
  locale,
}) => {
  const [checkedFilter, setCheckedFilter] = useState(category)
  const configColor = generateEventColorTheme(category)

  const calendar = useNextCalendarApp({
    views: [viewMonthGrid, viewMonthAgenda, viewWeek, viewDay],
    defaultView: 'month',
    calendars: configColor,
    // locale: 'ky-KG',
    locale: locale === 'ru' ? 'ru-RU' : 'kg-KG',
    workDays: {
      numberDays: [1, 2, 3, 4, 5],
    },
    plugins: [createEventModalPlugin()],
  })
  calendar?.events.set(
    data.filter((el) => checkedFilter.includes(el.calendarId!))
  )

  const handleCheckboxChange = (e: string) => {
    // Add the feature to the array if it's checked
    setCheckedFilter(e === 'all' ? [...category] : [e])
  }

  const filterEvents = () => {
    calendar?.events.set(
      data.filter((el) => checkedFilter.includes(el.calendarId!))
    )
  }
  useEffect(() => {
    filterEvents()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [checkedFilter])

  return (
    <div id='calendar' className='mt-6'>
      <div className='mb-2 flex items-center gap-4 smExtra:flex-col smExtra:items-start'>
        <h2
          className={
            'text-start font-poppins text-5xl font-bold leading-[62px] '
          }
        >
          {text.label}
        </h2>
        <FilterArea
          handleCheckboxChange={handleCheckboxChange}
          checkedFilter={checkedFilter}
          originalArray={category}
          configColor={configColor}
          text={text.filter}
        />
      </div>
      <ScheduleXCalendar calendarApp={calendar} />
    </div>
  )
}

export default XScheduler
