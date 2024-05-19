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
  const isActive = href === pathname

  

  return (
    <Link
      prefetch={true}
      href={href}
      className={`hoverLink ${isActive ? 'activeLink' : ''}`}
      locale={i}
    >
      {content}
    </Link>
  )
}

export default ActiveLinkClient
