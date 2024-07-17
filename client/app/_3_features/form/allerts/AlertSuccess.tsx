import { cn } from '@shared/index'

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
        'grid self-end  overflow-hidden bg-green-100  transition-grid-rows duration-300  ease-linear',
        className
      )}
    >
      <div
        className={cn('flex max-w-[600px] gap-3 overflow-hidden ', className)}
      >
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
            className='stroke-green-500'
          >
            <path d='M22 11.08V12a10 10 0 1 1-5.93-9.14' />
            <path d='m9 11 3 3L22 4' />
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
            className='stroke-green-500'
          >
            <path d='M18 6 6 18' />
            <path d='m6 6 12 12' />
          </svg>
        </div>
      </div>
    </div>
  )
}

export default AlertSuccess
