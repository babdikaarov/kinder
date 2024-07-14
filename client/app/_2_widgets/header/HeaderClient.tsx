'use client'

import { LocaleSwitcherClient } from '@/app/_3_features'
import { ActiveLinkClient, Logo, cn } from '@/app/_5_shared'
import { useState } from 'react'
import './header.css'
import BurgerIcon from './BurgerIcon'

interface HeaderClientProps {
  i: string
  content: {
    main: string
    about: string
    admin: string
    parents: string
    gallery: string
  }
}

const HeaderClient: React.FC<HeaderClientProps> = ({ i, content }) => {
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
        <ActiveLinkClient href={`/`} content={content.main} i={i} />
        <ActiveLinkClient href={`/#about`} content={content.about} i={i} />
        <ActiveLinkClient href={`/send-docs`} content={content.admin} i={i} />
        <ActiveLinkClient href={`/parent`} content={content.parents} i={i} />
        <ActiveLinkClient href={`/gallery`} content={content.gallery} i={i} />
        <LocaleSwitcherClient
          className='lg:absolute lg:right-9 lg:top-5'
          currentLocale={i}
        />
      </nav>
    </>
  )
}

export default HeaderClient
