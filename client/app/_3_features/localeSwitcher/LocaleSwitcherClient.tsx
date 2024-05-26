'use client'

import { cn } from '@/app/_5_shared'
// import Link from 'next/link'
import { usePathname, Link, useRouter } from '@/navigation'
import { useParams } from 'next/navigation'
import { useTransition } from 'react'

interface LocaleSwitcherClientProps {
  currentLocale: string
  className?: string
}

const LocaleSwitcherClient: React.FC<LocaleSwitcherClientProps> = ({
  className,
  currentLocale,
}) => {
  const router = useRouter()
  const pathname = usePathname()
  // const params = useParams()
  function changeLocale() {
    router.replace(pathname, { locale: currentLocale === 'ru' ? 'ky' : 'ru' })
  }
  return (
    <button onClick={changeLocale} className={cn('', className)}>
      {/* FIX_ME replace svg for animated */}
      <svg
        xmlns='http://www.w3.org/2000/svg'
        width='24'
        height='24'
        viewBox='0 0 24 24'
        fill='none'
        stroke='currentColor'
        strokeWidth='2'
        strokeLinecap='round'
        strokeLinejoin='round'
        className='lucide lucide-earth'
      >
        <path d='M21.54 15H17a2 2 0 0 0-2 2v4.54' />
        <path d='M7 3.34V5a3 3 0 0 0 3 3v0a2 2 0 0 1 2 2v0c0 1.1.9 2 2 2v0a2 2 0 0 0 2-2v0c0-1.1.9-2 2-2h3.17' />
        <path d='M11 21.95V18a2 2 0 0 0-2-2v0a2 2 0 0 1-2-2v-1a2 2 0 0 0-2-2H2.05' />
        <circle cx='12' cy='12' r='10' />
      </svg>
    </button>
  )
}

export default LocaleSwitcherClient
