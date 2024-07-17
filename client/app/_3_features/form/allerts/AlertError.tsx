import { cn } from '@shared/index'

interface AlertErrorProps {
  text: {
    title: string
    description: string
  }
  onClick: () => void
  className?: string
}

const AlertError: React.FC<AlertErrorProps> = ({
  text,
  onClick,
  className = '',
}) => {
  return (
    <div
      className={cn(
        'grid self-end  bg-red-100  transition-grid-rows duration-300  ease-linear',
        className
      )}
    >
      <div className={cn('flex max-w-[600px] gap-3 overflow-hidden  ')}>
        <div className='flex-[0]'>
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
            className='stroke-red-500'
          >
            <circle cx='12' cy='12' r='10' />
            <path d='m4.9 4.9 14.2 14.2' />
          </svg>
        </div>
        <div>
          <h3 className='text-lg font-extrabold'>{text.title}</h3>
          <p>{text.description}</p>
        </div>
        <div onClick={onClick} className='hover:cursor-pointer'>
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
            className='stroke-red-500'
          >
            <path d='M18 6 6 18' />
            <path d='m6 6 12 12' />
          </svg>
        </div>
      </div>
    </div>
  )
}

export default AlertError
