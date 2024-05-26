import { ActiveLinkClient, Logo } from '@shared/index'
import { getTranslations } from 'next-intl/server'

interface FooterProps {
  i: string
}

const Footer: React.FC<FooterProps> = async ({ i }) => {
  const t = await getTranslations()
  const url = process.env.CMS_API + '/api/detail?populate=*'
  const response = await fetch(url)
  if (!response.ok) throw Error('server is not responding')
  const data = await response.json()
  return (
    <footer className='sm500:flex-col container bottom-0 mb-5 flex max-w-wrapperLimit items-center justify-between sm500:gap-8'>
      <article className='flex max-w-[245px] flex-col gap-2.5 sm500:order-last sm500:self-start'>
        <Logo
          className='size-[108px]'
          title={data[i].orgName}
          to={`/${i}`}
          locale={i}
        />
      </article>
      <nav className='flex gap-5 self-start lg:flex-col sm:order-first'>
        <ActiveLinkClient
          href={`#about`}
          content={t('navigation_about')}
          i={i}
        />
        <ActiveLinkClient
          href={`/send-docs`}
          content={t('navigation_admin')}
          i={i}
        />
        <ActiveLinkClient
          href={`/parent`}
          content={t('navigation_parents')}
          i={i}
        />
        <ActiveLinkClient
          href={`/gallery`}
          content={t('navigation_gallery')}
          i={i}
        />
      </nav>
      <address id='contacts' className='flex flex-col self-start not-italic '>
        <p>{t('footer_address')}</p>
        <p>{data[i].address}</p>
      </address>
    </footer>
  )
}

export default Footer
