import { Wrapper } from '@shared/index'
import { useLocale } from 'next-intl'
import { getTranslations } from 'next-intl/server'
import { Link } from '@/navigation'

interface CalendarReferenceProps extends myTS.I {}

const CalendarReference: React.FC<CalendarReferenceProps> = async ({ i }) => {
  const locale = useLocale()
  const t = await getTranslations('homePage.calendarRefference')
  return (
    <Wrapper header={t('header')} id='' className='flex flex-col items-center'>
      <p className='mt-6 max-w-[602px] text-center text-fs-lg'>{t('promo')}</p>
      <Link href={`/calendar`} locale={i} className='mt-9' prefetch>
        <button className='button h-[62px] w-[269px] text-fs-6'>
          {t('button')}
        </button>
      </Link>
    </Wrapper>
  )
}

export default CalendarReference
