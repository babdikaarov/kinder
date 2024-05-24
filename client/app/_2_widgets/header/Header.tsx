import { Logo, cn } from '@/app/_5_shared'
import HeaderClient from './HeaderClient'
import { getTranslations } from 'next-intl/server'

interface HeaderProps {
  i: string
}

const Header: React.FC<HeaderProps> = async ({ i }) => {
  const t = await getTranslations()
  const content = {
    main: t('navigation_main'),
    about: t('navigation_about'),
    admin: t('navigation_admin'),
    parents: t('navigation_parents'),
    gallery: t('navigation_gallery'),
  }
  // console.log(content)
  return (
    <header className='fixed z-50 w-full  bg-theme-bg/40 backdrop-blur'>
      <div
        className={cn(
          ' m-auto flex h-[80px] w-full max-w-wrapperLimit items-center justify-around gap-9 ',
          'xl:px-5',
          'lg:h-16 lg:justify-end'
        )}
      >
        <Logo
          className={cn('size-[70px]', 'lg:size-[54px] ')}
          to={`/${i}`}
          locale={i}
        />
        <HeaderClient i={i} content={content} />
      </div>
    </header>
  )
}

export default Header
