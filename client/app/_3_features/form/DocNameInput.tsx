import { useEffect, useState } from 'react'
import { DocNameInputProps } from './types'

const DocNameInput: React.FC<DocNameInputProps> = ({
  name,
  onChange,
  value,
}) => {
  const [valueField, setValue] = useState(value)

  useEffect(() => {
    setValue(value)
  }, [value])

  return (
    <div className={`relative flex w-full`}>
      <input
        value={valueField}
        onChange={onChange}
        type='text'
        className={
          'peer h-[50px] w-full rounded border-[0.5px] border-dark-600 placeholder-transparent focus:border-dark-600 focus:outline-none'
        }
        placeholder={name}
        autoComplete='off'
        disabled
      />
      <label className=' absolute -top-3 left-3 bg-theme-bg text-dark-300 opacity-100 transition-all  peer-placeholder-shown:top-3 peer-placeholder-shown:opacity-75 peer-focus:-top-3 peer-focus:opacity-100 '>
        {name}
      </label>
    </div>
  )
}

export default DocNameInput
