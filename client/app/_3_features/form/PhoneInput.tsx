import { usePhoneInput } from 'react-international-phone'
import { InputProps } from './types'
import Warn from './allerts/warn'
import { cn } from '@/app/_5_shared'
import { useEffect } from 'react'

export const PhoneInput: React.FC<InputProps> = ({
  name,
  error,
  onChange,
  value,
  ...rest
}) => {
  
  const { inputValue, handlePhoneValueChange } = usePhoneInput({
    value: value?.toString(),
    defaultCountry: 'kg',
    onChange: ({ phone }) => {
      console.log(phone);
      if (onChange) {
        onChange(phone as unknown as React.ChangeEvent<HTMLInputElement>)
      }
    },
  })

  return (
    <>
      <div
        className={cn(
          `relative flex w-full max-w-[600px]`,
          error.length ? 'bg-red-100' : ''
        )}
      >
        <input
          {...rest}
          onChange={handlePhoneValueChange}
          id={name}
          type='text'
          className={
            ' peer h-[54px] min-w-full rounded border-[0.5px] border-dark-600 bg-transparent pt-5 text-fs-6 placeholder-transparent focus:border-dark-600 focus:outline-none'
          }
          placeholder={name}
          autoComplete='off'
          value={inputValue}
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
          {/* fixme add async validation remove asterix */}
          {name}
          {'*'}
        </label>
        <Warn error={error} className='' />
      </div>
    </>
  )
}
