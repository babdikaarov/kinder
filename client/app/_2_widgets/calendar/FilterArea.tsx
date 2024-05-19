'use client'

import { useEffect, useRef, useState } from 'react'
import { CalendarsConfig } from './calendarsConfig'
import { ChevronDown, ChevronUp } from 'lucide-react'
import { cn } from '@/app/_5_shared'
// import Select from 'react-select'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
  SelectIcon,
  SelectItemText,
} from './Select'
import { SelectLabel } from '@radix-ui/react-select'
interface FilterAreaProps {
  handleCheckboxChange: (e: string) => void
  checkedFilter: string[]
  originalArray: string[]
  configColor: CalendarsConfig
  text: string
}

const FilterArea: React.FC<FilterAreaProps> = ({
  handleCheckboxChange,
  checkedFilter,
  originalArray,
  configColor,
  text,
}) => {
  const [filterColor, setFilterColor] = useState<any | null>(null)
  const [isOpen, setIsOpen] = useState(false)
  const ref = useRef(null)

  useEffect(() => {
    setFilterColor(configColor)
  }, [configColor])

  return (
    <>
      <Select onValueChange={(e) => handleCheckboxChange(e)}>
        <SelectTrigger
          onClick={() => setIsOpen(!isOpen)}
          className='h-full min-w-[180px] rounded-lg border border-solid border-dark-600 bg-white '
        >
          <SelectValue
            defaultValue={originalArray[0]}
            placeholder={text}
            onChange={(e) => console.log(e.target)}
          />
          <SelectIcon asChild>
            <ChevronDown
              className={cn(
                `${isOpen ? 'rotate-true' : 'rotate-false'} transition-all ease-linear`,
                'h-4 w-4 opacity-50'
              )}
            />
          </SelectIcon>
        </SelectTrigger>
        <SelectContent
          className='z-50 bg-white'
          onClick={() => setIsOpen(!isOpen)}
        >
          <SelectItem
            value={'all'}
            className='flex w-full items-center gap-5 capitalize'
          >
            <SelectItemText
              className={cn(
                ' hover:cursor-pointer',
                'flex w-full items-center gap-3 '
              )}
            >
              {text}
            </SelectItemText>
          </SelectItem>
          {originalArray.map((el, index) => (
            <SelectItem
              key={index}
              value={el}
              className='flex w-full items-center gap-5 capitalize'
            >
              <SelectItemText
                className={cn(
                  ' hover:cursor-pointer',
                  'flex w-full items-center gap-3 '
                )}
              >
                {el}
              </SelectItemText>
              <div
                style={{
                  backgroundColor: `${filterColor ? filterColor[el].lightColors.container : ''}`,
                }}
                className={cn(
                  'z-50 inline size-3 min-h-3 min-w-3 rounded-full bg-red-500'
                )}
              ></div>
            </SelectItem>
          ))}
        </SelectContent>
      </Select>

      {/* 
      <fieldset className='relative mb-2 rounded-10 border border-black bg-white p-4'>
        <legend>Категории:</legend>
        <div className='flex gap-2 '>
          {originalArray.map((el, index) => (
            <div
              key={index}
              className={`flex h-8 items-center rounded border-[1px] border-solid border-black p-3 `}
              style={{
                backgroundColor: `${filterColor ? filterColor[el].lightColors.container : ''}`,
              }}
            >
              <label htmlFor={el} className={`cursor-pointer select-none`}>
                <input
                  type='checkbox'
                  id={el}
                  name={el}
                  onChange={handleCheckboxChange}
                  checked={checkedFilter.includes(el)}
                  className={`rounded bg-[${filterColor ? filterColor[el].lightColors.container : ''}]`}
                  style={{
                    color: `${filterColor ? filterColor[el].lightColors.main : ''}`,
                  }}
                />

                {el}
              </label>
            </div>
          ))}
        </div>
      </fieldset> */}
    </>
  )
}

export default FilterArea
