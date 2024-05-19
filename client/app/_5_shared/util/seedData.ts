import { RRule, rrulestr } from 'rrule'

type DATA = {
  id: string
  title?: string
  start: string
  end: string
  calendarId: string
  description?: string
  location?: string
  rrule: string
}

export function seedRecurrence(data: DATA): DATA[] {
  const rule = sanitizeRRulestr(data.rrule)
  const rruleStart = rrulestr(rule, { dtstart: new Date(data.start) })
  const rruleEnd = rrulestr(rule, { dtstart: new Date(data.end) })

  const arrStart = convertDateArray(rruleStart, data.start.includes(' '))
  const arrEnd = convertDateArray(rruleEnd, data.end.includes(' '))
  // console.log(arrStart[0], arrEnd[0])
  // console.log(rule)
  return arrStart.map((_, i) => ({
    ...data,
    id: data.id + i,
    start: arrStart[i],
    end: arrEnd[i],
  }))
}

export function sanitizeRRulestr(str: string): string {
  // Check for FREQ values
  if (
    str.includes('FREQ=WEEKLY') ||
    str.includes('FREQ=DAILY') ||
    str.includes('FREQ=MONTHLY')
  ) {
    // If no COUNT or UNTIL is specified, add COUNT=365
    if (!str.includes('COUNT=') && !str.includes('UNTIL=')) {
      str += ';COUNT=365'
    }
  } else if (str.includes('FREQ=YEARLY')) {
    // For FREQ=YEARLY, add COUNT=20
    if (!str.includes('COUNT=')) {
      str += ';COUNT=20'
    }
  }
  return str
}

export function convertDateArray(arr: RRule, hasTimeStamp: boolean): string[] {
  return arr.all().map((el) => {
    const dtstartInOriginalTimezone = el.toLocaleString('en-US', {
      //   timeZone: originalTimezone,
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
      hour: '2-digit',
      minute: '2-digit',
      hour12: false,
    })
    const arr = dtstartInOriginalTimezone.split(',')
    const parse = arr[0].split('/')
    const formattedDate = `${parse[2]}-${parse[0]}-${parse[1]}`
    arr[0] = formattedDate
    if (!hasTimeStamp) delete arr[1]
    return hasTimeStamp ? arr.join('') : arr[0]
  })
}
