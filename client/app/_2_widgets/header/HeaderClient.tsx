'use client'

import { LocaleSwitcherClient } from '@entities/index'
import { ActiveLinkClient, Logo, cn } from '@shared/index'
import { useState } from 'react'
import BurgerIcon from './BurgerIcon'
import './header.css'

interface HeaderClientProps extends myTS.I {
  content: {
    main: string
    about: string
    admin: string
    parents: string
    gallery: string
  }
}

const HeaderClient: React.FC<HeaderClientProps> = ({ locale, content }) => {
  const [isOpen, setOpen] = useState(false)

  return (
    <>
      <button
        className={cn(
          'burgerButton top-3 z-[52] hidden',
          'lg:absolute lg:left-5 lg:block',
          'data-[state=open]:lg:left-1/2',
          'data-[state=open]:lg:pl-3',
          'transition-all duration-300',
          'data-[state=open]:smExtra:left-[70%]'
        )}
        onClick={() => setOpen(!isOpen)}
        data-state={isOpen ? 'open' : 'closed'}
      >
        <BurgerIcon />
      </button>
      <div
        onClick={() => setOpen(false)}
        data-state={isOpen ? 'open' : 'closed'}
        className={cn(
          'data-[state=open]:absolute data-[state=open]:left-0 data-[state=open]:right-0  data-[state=open]:z-[51]',
          ' data-[state=open]:min-h-svh data-[state=open]:w-full data-[state=open]:bg-black ',
          'burgerOverlay absolute top-0 hidden opacity-0 transition-opacity duration-300 data-[state=open]:opacity-35 lg:block'
        )}
      ></div>

      <nav
        className={cn(
          'smExtra:w-[70%]',
          'z-[52] flex flex-1 justify-end gap-5',
          ' transition-all duration-300 lg:absolute lg:top-0 lg:h-[832px] lg:w-1/2 lg:flex-col lg:justify-start lg:rounded-br-10 lg:rounded-tr-10 lg:bg-theme-bg lg:px-9 lg:py-5 ',

          isOpen ? 'lg:-left-0' : 'lg:-left-1/2 smExtra:-left-[70%]'
        )}
      >
        <ActiveLinkClient href={`/`} content={content.main} locale={locale} />
        <ActiveLinkClient
          href={`/#about`}
          content={content.about}
          locale={locale}
        />
        <ActiveLinkClient
          href={`/send-docs`}
          content={content.admin}
          locale={locale}
        />
        <ActiveLinkClient
          href={`/parent`}
          content={content.parents}
          locale={locale}
        />
        <ActiveLinkClient
          href={`/gallery`}
          content={content.gallery}
          locale={locale}
        />
        <LocaleSwitcherClient
          className='lg:absolute lg:right-9 lg:top-5'
          currentLocale={locale}
        />
      </nav>
    </>
  )
}

export default HeaderClient
