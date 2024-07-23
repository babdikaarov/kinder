import { InputProps } from '../types'
import AlertWarn from '../allerts/AlertWarn'
import { cn } from '@shared/index'

export const TextInput: React.FC<InputProps> = ({
  name,
  error,
  className,
  ...rest
}) => {
  return (
    <div
      className={cn(
        `relative flex w-full max-w-[600px]`,
        error.length ? 'bg-red-100' : ''
      )}
    >
      <input
        {...rest}
        id={name}
        type='text'
        className={cn(
          ' peer h-[54px] min-w-full rounded border-[0.5px] border-dark-600 bg-transparent pt-5 text-base placeholder-transparent focus:border-dark-600 focus:outline-none',
          className
        )}
        placeholder={name}
        autoComplete='off'
      />
      <label
        htmlFor={name}
        className={cn(
          'text-dark-300',
          'absolute -top-0 left-3 bg-transparent text-xs  opacity-75 transition-all ',
          'peer-placeholder-shown:top-4 peer-placeholder-shown:text-base peer-placeholder-shown:opacity-75',
          'peer-focus:-top-0 peer-focus:text-xs  peer-focus:opacity-75',
          'peer-focus-visible:text-xs'
        )}
      >
        {name}
        {'*'}
      </label>
      <AlertWarn error={error} className='' />
    </div>
  )
}
