import { Check, Minus, TriangleAlert, Upload, X } from 'lucide-react'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
  DialogOverlay,
  DialogClose,
} from './Dialog'
import React, { useCallback, useEffect, useRef, useState } from 'react'
import { useDropzone } from 'react-dropzone'
import { cn } from '@/app/_5_shared'
import { shortenFileName } from './DocFileInput'
import { fileUrls } from './types'
interface DialogDemoProps {
  myRef: React.MutableRefObject<null>
  text: {
    button: string
    title: string
    save: string
    note: string
    clickDrop: {
      clickAndDrop: string
      drop: string
    }
    upload: string
    error: {
      duplicate: string
      limit: string
      sizeLimit: string
      isNotSameExtention: string
    }
  }
  forwardInput: any
  className: string
  setFileUrls: React.Dispatch<React.SetStateAction<fileUrls[]>>
  fileUrls: fileUrls[]
}
interface FileWithPreview extends File {
  preview: string
}
export default function DialogDemo({
  myRef,
  text,
  forwardInput,
  className,
  setFileUrls,
  fileUrls,
}: DialogDemoProps) {
  const [files, setFiles] = useState<File[]>([])
  const [errorState, setErrorState] = useState({
    isDuplicate: false,
    isNotSameExtention: false,
    sizeLimit: false,
    name: '',
    sameFileNames: '',
    sizeLimitFileNames: '',
  })
  const onDrop = (acceptedFiles: File[]) => {
    setFiles((prev) => [...prev, ...acceptedFiles])
    setFileUrls((previousFiles) => [
      ...previousFiles,
      ...acceptedFiles.map((file) => ({
        name: file.name,
        shortName: shortenFileName(file.name),
        size: (file.size / (1024 * 1024)).toFixed(2),
        url: URL.createObjectURL(file),
      })),
    ])

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }
  const { getRootProps, getInputProps, isDragActive, fileRejections } =
    useDropzone({ onDrop })

  const save = () => {
    const dataTransfer = new DataTransfer()
    files.forEach((file: File) => {
      dataTransfer.items.add(file)
    })

    forwardInput(dataTransfer.files)
  }
  const removeFile = (name: string) => {
    setFileUrls((files) => {
      const removed = files.some((file, index) => {
        if (file.name === name) {
          files.splice(index, 1)
          return true
        }
        return false
      })
      return removed ? [...files] : files
    })
    setFiles((files) => {
      const removed = files.some((file, index) => {
        if (file.name === name) {
          files.splice(index, 1)
          return true
        }
        return false
      })
      return removed ? [...files] : files
    })
  }
  useEffect(() => {
    let isDuplicate = false
    let isNotSameExtention = false
    let sizeLimit = false
    let sizeLimitFileNames = []
    const sizeMB = 10 * 1024 * 1024 //file size limit 10mb
    for (let i = 0; i < files.length; i++) {
      for (let j = i + 1; j < files.length; j++) {
        if (files[i].name === files[j].name && files.length <= 2) {
          isDuplicate = true
          break
        }
        if (files[i].type !== files[j].type && files.length <= 2) {
          isNotSameExtention = true
          break
        }
      }
      if (files[i].size > sizeMB && files.length <= 2) {
        sizeLimit = true
        sizeLimitFileNames.push(`...${files[i].name.slice(-12)}`)
      }
      if (isDuplicate || isNotSameExtention || sizeLimit) {
        break
      }
    }
    setErrorState({
      isDuplicate: isDuplicate,
      name: isDuplicate ? `...${files[0].name.slice(-12)}` : '',
      sizeLimit: sizeLimit,
      sizeLimitFileNames: sizeLimit ? sizeLimitFileNames.join(', ') : '',
      isNotSameExtention: isNotSameExtention,
      sameFileNames: isNotSameExtention
        ? `...${files[0].name.slice(-12)} , ...${files[1].name.slice(-12)}`
        : '',
    })
  }, [files])

  const fileRejectionItems = (
    content: string | number,
    option: 'limit' | 'duplicate' | 'sizeLimit' | 'sameExtention'
  ) => {
    return (
      <div>
        <TriangleAlert className='float-left mr-1 stroke-[#F93232]' />
        {option === 'limit' ? (
          <span className='text-[#f93232ad]'>{text.error.limit}</span>
        ) : null}
        {option === 'duplicate' ? (
          <span className='text-[#f93232ad]'>
            {text.error.duplicate}: {content}
          </span>
        ) : null}
        {option === 'sameExtention' ? (
          <span className='text-[#f93232ad]'>
            {text.error.isNotSameExtention}: {content}
          </span>
        ) : null}
        {option === 'sizeLimit' ? (
          <span className='text-[#f93232ad]'>
            {text.error.sizeLimit}: {content}
          </span>
        ) : null}
      </div>
    )
  }

  return (
    <Dialog>
      <DialogTrigger asChild>
        <button
          className={cn(
            'button absolute top-0 flex h-[50px] w-full min-w-[196px]  items-center justify-center gap-2 p-2   ',
            className
          )}
          ref={myRef}
          type='button'
        >
          {text.button}
        </button>
      </DialogTrigger>
      <DialogOverlay className='bg-[#1A1A1A42] ' />
      <DialogContent
        className='bg-[#F9F9F9] text-black sm:max-w-[425px] '
        onInteractOutside={(e) => {
          e.preventDefault()
        }}
      >
        <DialogClose asChild>
          {/* <button className='absolute right-0 top-0' aria-label='Close'>
            <X />
          </button> */}
        </DialogClose>
        <DialogHeader>
          <DialogTitle className='text-fs-lg text-black'>
            {text.title}
          </DialogTitle>
        </DialogHeader>

        <div className='flex flex-col gap-6 '>
          <div
            {...getRootProps()}
            className={cn(
              'flex flex-col items-center gap-6 rounded-10 border-[2px] border-solid border-[#A8A8A8] p-5',
              isDragActive ? 'bg-green-100' : ''
            )}
          >
            <input {...getInputProps()} />
            <Upload />
            {isDragActive ? (
              <p>{text.clickDrop.drop}</p>
            ) : (
              // eslint-disable-next-line react/no-unescaped-entities
              <p>{text.clickDrop.clickAndDrop}</p>
            )}

            <p>{text.note}</p>

            <button
              type='button'
              className='button h-[35px]  w-[120px] bg-blue-500'
            >
              {text.upload}
            </button>
          </div>
          <ul className='flex flex-col gap-6'>
            {fileUrls.map((file, i) => (
              <li
                key={i}
                className=' flex h-[35px] items-center justify-between gap-1'
              >
                <div className='flex items-center gap-2'>
                  <a
                    href={file.url}
                    target='_blank'
                    className='boxShadow relative flex items-center rounded  p-2  text-fs-base hover:underline'
                  >
                    {file.name.slice(-20)} - {file.size}mb
                  </a>
                  <button
                    type='button'
                    className='border-secondary-400 -right-5 -top-3 z-10 flex h-7 w-7 items-center justify-center rounded-full border bg-red-200 transition-colors hover:bg-red-400'
                    onClick={() => removeFile(file.name)}
                  >
                    <Minus className='hover:fill-secondary-400 size-full fill-white transition-colors' />
                  </button>
                </div>
                <Check className='aspect-square  size-[28px] bg-green-200' />
              </li>
            ))}
            {files.length > 2
              ? fileRejectionItems(files.length, 'limit')
              : null}
            {errorState.isDuplicate
              ? fileRejectionItems(errorState.name, 'duplicate')
              : null}
            {errorState.isNotSameExtention
              ? fileRejectionItems(errorState.sameFileNames, 'sameExtention')
              : null}
            {errorState.sizeLimit
              ? fileRejectionItems(errorState.sizeLimitFileNames, 'sizeLimit')
              : null}
          </ul>
        </div>
        <DialogFooter>
          <DialogClose asChild>
            <button
              type='button'
              className={cn(
                'button h-[35px] w-[120px] self-center rounded bg-blue-500 text-white',
                (files && files.length > 2) ||
                  errorState.isDuplicate ||
                  errorState.isNotSameExtention ||
                  errorState.sizeLimit
                  ? // || files.length == 0
                    'bg-slate-200 text-black'
                  : ''
              )}
              disabled={
                (files && files.length > 2) ||
                errorState.isDuplicate ||
                errorState.isNotSameExtention ||
                errorState.sizeLimit
                //  || files.length == 0
              }
              onClick={save}
            >
              {text.save}
            </button>
          </DialogClose>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}
