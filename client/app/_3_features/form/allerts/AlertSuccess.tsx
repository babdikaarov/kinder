import { cn } from '@shared/index'
import { CircleCheckBig, X } from 'lucide-react'

interface AlertSuccessProps {
  text: {
    title: string
    description: string
  }
  onClick: () => void
  className?: string
}

const AlertSuccess: React.FC<AlertSuccessProps> = ({
  text,
  onClick,
  className = '',
}) => {
  return (
    <div
      className={cn(
        'grid self-end  bg-green-100  transition-grid-rows duration-300  ease-linear',
        className
      )}
    >
      <div className={cn('flex max-w-[600px] gap-3 overflow-hidden ')}>
        <div className='flex-[0]'>
          <CircleCheckBig className='stroke-green-500' />
        </div>
        <div>
          <h3 className='text-lg font-extrabold'>{text.title}</h3>
          <p>{text.description}</p>
        </div>
        <div onClick={onClick} className='hover:cursor-pointer'>
          <X className='stroke-green-500' />
        </div>
      </div>
    </div>
  )
}

export default AlertSuccess
