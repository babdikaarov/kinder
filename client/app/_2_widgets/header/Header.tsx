import { Logo, cn } from '@shared/index'
import HeaderClient from './HeaderClient'
import { getTranslations } from 'next-intl/server'

interface HeaderProps extends myTS.I {}

const Header: React.FC<HeaderProps> = async ({ locale }) => {
  const t = await getTranslations()
  const content = {
    main: t('navigation_main'),
    about: t('navigation_about'),
    admin: t('navigation_admin'),
    parents: t('navigation_parents'),
    gallery: t('navigation_gallery'),
  }
  return (
    <header className='grainyEffect fixed z-50 w-full  bg-theme-bg/40 backdrop-blur'>
      <div
        className={cn(
          ' m-auto flex h-[80px] w-full max-w-wrapperLimit items-center justify-around gap-9 ',
          'xl:px-5',
          'lg:h-16 lg:justify-end'
        )}
      >
        <Logo
          className={cn('size-[70px]', 'lg:size-[54px] ')}
          to={`/${locale}`}
          locale={locale}
        />
        <HeaderClient locale={locale} content={content} />
      </div>
    </header>
  )
}

export default Header
