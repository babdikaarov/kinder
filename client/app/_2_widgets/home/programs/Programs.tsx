import { getData } from '@entities/index'
import { Wrapper } from '@shared/index'
import { getTranslations } from 'next-intl/server'
import SwiperPrograms from './Swiper'

interface ProgramsProps extends myTS.I {}

const Programs: React.FC<ProgramsProps> = async ({ locale }) => {
  const t = await getTranslations()
  const data = await getData('/api/home-program-items?&populate=*')
  return (
    <Wrapper
      header={t('home_programs_header')}
      id='home_programs'
      className='relative'
    >
      <SwiperPrograms data={data} locale={locale} />
    </Wrapper>
  )
}

export default Programs
