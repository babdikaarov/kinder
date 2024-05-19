import { Wrapper } from '@shared/index'
import Gglmap from './Gglmap'
import { getTranslations } from 'next-intl/server'
import { getData } from '@entities/index'

interface MapProps extends myTS.I {}

const Map: React.FC<MapProps> = async ({ i }) => {
  const t = await getTranslations('homePage.map')
  const data = await getData('/api/detail?populate=*')
  return (
    <Wrapper className='flex  w-full flex-wrap gap-5'>
      <div className='flex w-full min-w-[225px] flex-[0.7] flex-col items-center justify-center gap-5 rounded-10 bg-biege-600 py-3 smExtra:flex-[1]'>
        <h4 className='text-2xl'>{t('contacts')}</h4>
        <div className='flex flex-col gap-2'>
          <p aria-details='contacts'>{data[i].tel1}</p>
          <p aria-details='contacts'>{data[i].tel2}</p>
        </div>
      </div>
      <div className='flex w-full min-w-[225px] flex-[0.7] flex-col items-center justify-center gap-5 rounded-10 bg-biege-400 smExtra:flex-[1] smExtra:py-3'>
        <h4 className='text-2xl'>{t('hours')}</h4>
        <div className='flex flex-col gap-2'>
          <p>{data[i].weekday}</p>
          <p>{data[i].weekend}</p>
        </div>
      </div>
      <Gglmap />
    </Wrapper>
  )
}

export default Map
