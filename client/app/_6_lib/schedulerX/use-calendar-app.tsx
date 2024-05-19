import {
  CalendarApp,
  CalendarConfig,
  createCalendar,
} from '@babdikaarov/calendar'
import { useEffect, useState } from 'react'

export function useCalendarApp(config: CalendarConfig) {
  const [calendarApp] = useState(createCalendar(config))
  return calendarApp
}

export function useNextCalendarApp(config: CalendarConfig) {
  const [calendarApp, setCalendarApp] = useState<CalendarApp>()

  useEffect(() => {
    if (typeof window !== 'undefined') {
      setCalendarApp(createCalendar(config))
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return calendarApp
}
