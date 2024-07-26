import { Wrapper } from '@shared/index'
import Gglmap from './Gglmap'
import { getTranslations } from 'next-intl/server'
import { getData } from '@entities/index'

interface MapProps extends myTS.I {}

const Map: React.FC<MapProps> = async ({ locale }) => {
  const t = await getTranslations()
  const data = await getData('/cms/api/detail?populate=*')

  return (
    <Wrapper className='flex  w-full flex-wrap gap-5'>
      <div className='flex w-full min-w-[225px] flex-[0.7] flex-col items-center justify-center gap-5 rounded-10 bg-biege-600 py-3 smExtra:flex-[1]'>
        <h4 className='text-2xl'>{t('home_map_contacts')}</h4>
        <div className='flex flex-col gap-2'>
          <p aria-details='contacts'>{data[locale].tel1}</p>
          <p aria-details='contacts'>{data[locale].tel2}</p>
        </div>
      </div>
      <div className='flex w-full min-w-[225px] flex-[0.7] flex-col items-center justify-center gap-5 rounded-10 bg-biege-400 smExtra:flex-[1] smExtra:py-3'>
        <h4 className='text-2xl'>{t('home_map_hours')}</h4>
        <div className='flex flex-col gap-2'>
          <p>{data[locale].weekday}</p>
          <p>{data[locale].weekend}</p>
        </div>
      </div>
      <Gglmap shareLink={data.shareLink} />
    </Wrapper>
  )
}

export default Map
