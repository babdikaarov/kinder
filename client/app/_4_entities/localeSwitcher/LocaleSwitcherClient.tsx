'use client'

import { cn } from '@shared/index'
import { usePathname, useRouter } from '@/navigation'
import { Earth } from 'lucide-react'

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
  function changeLocale() {
    router.replace(pathname, { locale: currentLocale === 'ru' ? 'ky' : 'ru' })
  }
  return (
    <button onClick={changeLocale} className={cn('', className)}>
      <div className='animationContent'>
        <Earth />
      </div>
    </button>
  )
}

export default LocaleSwitcherClient
