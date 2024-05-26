'use client'

import { ChevronLeft } from 'lucide-react'
import { useRouter } from 'next/navigation'

interface ArrowProps {
  tomain?: boolean
}

const Arrow: React.FC<
  ArrowProps & React.HtmlHTMLAttributes<HTMLButtonElement>
> = ({ className = '', tomain = false, ...rest }) => {
  const router = useRouter()
  const handleNavigatoin = () => {
    if (tomain) {
      router.push('/', { scroll: true })
    } else {
      router.back()
    }
  }
  return (
    <button
      className={`${className} z-20`}
      {...rest}
      onClick={handleNavigatoin}
    >
      <ChevronLeft className='size-[40px]' />
    </button>
  )
}

export default Arrow
