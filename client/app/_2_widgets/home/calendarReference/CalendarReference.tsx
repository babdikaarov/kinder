import { Wrapper, cn } from '@shared/index'
import { useLocale } from 'next-intl'
import { getTranslations } from 'next-intl/server'
import { Link } from '@/navigation'
import ArrowAnimated from '@/app/_5_shared/icons/ArrowAnimated'

interface CalendarReferenceProps extends myTS.I {}

const CalendarReference: React.FC<CalendarReferenceProps> = async ({ i }) => {
  const locale = useLocale()
  const t = await getTranslations()
  return (
    <Wrapper
      header={t('home_calendar_reference_header')}
      id=''
      className='flex flex-col items-center'
    >
      <p className='mt-6 max-w-[602px] text-center text-fs-lg'>
        {t('home_calendar_reference_promo')}
      </p>
      <Link
        href={`/calendar`}
        locale={i}
        className='button group mt-9 flex h-[62px] w-[269px] items-center justify-center gap-1 text-fs-6'
        prefetch
      >
        <button>{t('home_calendar_reference_button')}</button>
        <ArrowAnimated
          className={cn(
            'w-0 transition-all duration-200 ease-linear ',
            'group-hover:relative group-hover:w-8'
          )}
        />
      </Link>
    </Wrapper>
  )
}

export default CalendarReference
