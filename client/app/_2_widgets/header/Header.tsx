import { Logo, cn } from '@/app/_5_shared'
import HeaderClient from './HeaderClient'
import { getTranslations } from 'next-intl/server'

interface HeaderProps {
  i: string
}

const Header: React.FC<HeaderProps> = async ({ i }) => {
  const t = await getTranslations('header.nav')
  const content = {
    main: t('main'),
    about: t('about'),
    admin: t('admin'),
    parents: t('parents'),
    gallery: t('gallery'),
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
        <Logo className={cn('size-[75px]', 'lg:size-[54px] ')} />
        <HeaderClient i={i} content={content} />
      </div>
    </header>
  )
}

export default Header
