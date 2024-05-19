'use client'

import { Eye, FilePlus2, Trash2 } from 'lucide-react'
import { useCallback, useEffect, useRef, useState } from 'react'
import DialogDemo from './Modal'
import { cn } from '@/app/_5_shared'
import { DocFileInputProps, fileUrls } from './types'
import Warn from './allerts/warn'

const DocFileInput: React.FC<DocFileInputProps> = ({
  show,
  removeField,
  multiple = false,
  onChange,
  error,
  text,
  value,
}) => {
  const [fileUrls, setFileUrls] = useState<fileUrls[]>([])
  const refDialog = useRef(null)
  const refInput = useRef(null)
  const createObjectUrls = useCallback(() => {
    if (value) {
      const newFileUrls: fileUrls[] = []
      for (let i = 0; i < value.length; i++) {
        const file = value.item(i)
        if (file) {
          newFileUrls.push({
            name: file.name,
            shortName: shortenFileName(file.name),
            size: (file.size / (1024 * 1024)).toFixed(2),
            url: URL.createObjectURL(file),
          })
        }
      }
      setFileUrls(newFileUrls)
    }
  }, [value])

  useEffect(() => {
    if (value) {
      if (value.length !== fileUrls.length) {
        createObjectUrls()
      }
    }
    return () => {
      fileUrls.forEach((e) => URL.revokeObjectURL(e.url))
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [show])

  const handleRemove = () => {
    removeField()
    fileUrls.forEach((e) => URL.revokeObjectURL(e.url))
    setFileUrls([])
  }

  function openDialog() {
    if (!refDialog.current) return
    const dialog = refDialog.current as HTMLButtonElement
    dialog.click()
  }
  function handleOpenInput() {
    if (!refInput.current) return
    const input = refInput.current as HTMLInputElement
    input.click()
  }

  return (
    <div
      className={cn(
        'absolute left-full top-0 ml-3 flex items-center gap-5',
        'lgExtra:relative lgExtra:left-0 lgExtra:ml-0 lgExtra:mt-4'
      )}
    >
      <div className='button relative h-[50px] min-w-[196px] flex-1'>
        <div
          className={cn(
            'flex h-[50px] min-w-[196px] items-center justify-center  gap-2  p-2',
            'text-center lgExtra:w-full lgExtra:justify-between lgExtra:px-6 sm:px-2'
          )}
        >
          <div className='flex flex-col items-end lgExtra:flex-row lgExtra:gap-6 sm:flex-col sm:gap-0'>
            {fileUrls.map((el, i) => (
              <a
                key={i}
                href={el.url}
                target='_blank'
                className=' flex items-center gap-2 text-[12px] hover:underline'
              >
                {el.shortName} - {el.size}mb
                <Eye className=' size-[20px] hover:cursor-pointer' />
              </a>
            ))}
          </div>
        </div>
        {multiple ? (
          <DialogDemo
            text={text}
            myRef={refDialog}
            forwardInput={onChange}
            className={!fileUrls.length ? ' z-0' : '-z-10'}
            setFileUrls={setFileUrls}
            fileUrls={fileUrls}
          ></DialogDemo>
        ) : (
          <label
            className={cn(
              !fileUrls.length ? ' z-0' : '-z-10',
              'absolute top-0 flex h-[50px] w-full min-w-[196px] items-center justify-center hover:cursor-pointer'
            )}
          >
            choose file2
            <input
              ref={refInput}
              multiple={multiple}
              type='file'
              className='absolute z-10 w-0 opacity-0'
              onChange={(e) => onChange(e.target.files)}
            />
          </label>
        )}
        <Warn error={error} className={'z-30'} />
      </div>

      <button
        type='button'
        className={cn(
          ' button h-[50px]  min-w-[50px] bg-blue-500',
          !fileUrls.length ? 'absolute -z-10' : ''
        )}
        onClick={multiple ? openDialog : handleOpenInput}
      >
        <FilePlus2 className='m-auto' />
      </button>
      <button
        type='button'
        className=' button h-[50px]  min-w-[50px] bg-blue-500'
        onClick={handleRemove}
      >
        <Trash2 className='m-auto' />
      </button>
    </div>
  )
}

export default DocFileInput

export const shortenFileName = (fileName: string, maxLength = 18) => {
  if (fileName.length <= maxLength) {
    return fileName
  } else {
    const extensionIndex = fileName.lastIndexOf('.')
    const extension = fileName.substring(extensionIndex)
    const truncatedName =
      '...' +
      fileName.substring(fileName.length - (maxLength - 3 - extension.length))
    return truncatedName
  }
}
