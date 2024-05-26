'use client'

import { cn } from '@/app/_5_shared'
import Warn from './allerts/warn'
import { FormOptionsProps } from './types'

const FormOptions: React.FC<FormOptionsProps> = ({
  changeHandler,
  opt,
  error,
  lang,
}) => {
  const handleFormOptionChange = (event: any) => {
    changeHandler(event.target.value)
  }

  return (
    <div
      className={cn(
        'relative grid w-full max-w-[600px] grid-cols-2auto grid-rows-2 gap-4 rounded',
        error.length ? 'bg-red-100 outline outline-2 outline-red-100' : '',
        'smExtra:grid-cols-1'
      )}
    >
      {Object.entries(opt).map(([key, value]) => (
        <label key={key} className='w-full text-base hover:cursor-pointer'>
          <input
            className='mr-2 rounded-full'
            type='radio'
            name='options'
            value={key}
            onClick={handleFormOptionChange}
          />
          {/* fixme add async validation remove asterix */}
          {value.name[lang]}
          {'*'}
        </label>
      ))}
      <Warn error={error} className='-top-[25px] h-4' />
    </div>
  )
}

export default FormOptions
