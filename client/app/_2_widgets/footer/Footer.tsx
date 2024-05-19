import { ActiveLinkClient, Logo } from '@shared/index'
import { getTranslations } from 'next-intl/server'

interface FooterProps {
  i: string
}

const Footer: React.FC<FooterProps> = async ({ i }) => {
  const t = await getTranslations('footer')
  const url = process.env.CMS_API + '/api/detail?populate=*'
  const response = await fetch(url)
  if (!response.ok) throw Error('server is not responding')
  const data = await response.json()
  return (
    <footer className='container bottom-0 mb-5 flex max-w-wrapperLimit items-center justify-between sm:flex-col sm:gap-8'>
      <article className='flex max-w-[245px] flex-col gap-2.5 sm:order-last sm:self-start'>
        <Logo className='size-[108px]' title={data[i].orgName} />
      </article>
      <nav className='flex gap-5 self-start lg:flex-col sm:order-first'>
        <ActiveLinkClient href={`/`} content={t('nav.main')} i={i} />
        <ActiveLinkClient href={`#about`} content={t('nav.about')} i={i} />
        <ActiveLinkClient href={`/send-docs`} content={t('nav.admin')} i={i} />
        <ActiveLinkClient href={`/parent`} content={t('nav.parents')} i={i} />
        <ActiveLinkClient href={`/gallery`} content={t('nav.gallery')} i={i} />
      </nav>
      <address id='contacts' className='flex flex-col self-start not-italic '>
        <p>{t('address')}</p>
        <p>{data[i].address}</p>
      </address>
    </footer>
  )
}

export default Footer
