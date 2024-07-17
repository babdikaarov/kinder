import { cn } from '@shared/index'
import { ValidationError } from '@tanstack/react-form'
import { CircleAlert } from 'lucide-react'

interface AlertWarnProps {
  error: ValidationError[]
  className: string
}

const AlertWarn: React.FC<AlertWarnProps> = ({ error, className }) => {
  if (!error) return null
  return error.length ? (
    <div
      className={cn(
        'absolute -bottom-[23px] flex h-5 w-full max-w-[600px] items-center gap-3 text-nowrap ',
        className
      )}
    >
      <CircleAlert className='size-4 stroke-red-300' />
      <p className='inline flex-[2] text-fs-sm text-red-600'>{error}</p>
    </div>
  ) : null
}

export default AlertWarn
