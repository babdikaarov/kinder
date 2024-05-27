'use client'

import { Link } from '@/navigation'
import { usePathname } from 'next/navigation'

interface ActiveLinkClientProps extends myTS.I {
  href: string
  content: string
}

const ActiveLinkClient: React.FC<ActiveLinkClientProps> = ({
  content,
  href,
  i,
}) => {
  const pathname = usePathname()
  const isActive = href === pathname || `/${i + href}` === pathname

  return (
    <div className='relative w-fit'>
      <Link
        prefetch={true}
        href={href}
        className={isActive ? 'activeLink' : 'hoverLink'}
        locale={i}
      >
        {content}
      </Link>
    </div>
  )
}

export default ActiveLinkClient
