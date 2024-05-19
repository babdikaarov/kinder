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
      {/* <svg
        width='40'
        height='40'
        viewBox='0 0 40 40'
        fill='none'
        xmlns='http://www.w3.org/2000/svg'
      >
        <path
          d='M25.8335 30L15.8335 20L25.8335 10'
          stroke='#333333'
          strokeWidth='1.66667'
          strokeLinecap='round'
          strokeLinejoin='round'
        />
      </svg> */}
    </button>
  )
}

export default Arrow
