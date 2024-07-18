'use client'

import { ChevronLeft } from 'lucide-react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'

interface ArrowProps {
  locale?: string
  href: string
}

const Arrow: React.FC<ArrowProps & React.HTMLAttributes<HTMLAnchorElement>> = ({
  className = '',
  locale,
  href,
  ...rest
}) => {
  return (
    <Link
      href={href}
      locale={locale}
      className={`${className} z-[15]`}
      {...rest}
    >
      <ChevronLeft className='size-[40px]' />
    </Link>
  )
}

export default Arrow
