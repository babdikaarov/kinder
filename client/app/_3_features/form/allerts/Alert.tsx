'use client'

import { ArrowAnimated, cn } from '@shared/index'
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from '@lib/radixui/AlertLib'

interface AlertProps {
  myRef: React.MutableRefObject<null>
  refFrom: React.MutableRefObject<null>
  text: {
    title: string
    description: string
    cancel: string
    submit: string
  }
}

const Alert: React.FC<AlertProps> = ({ myRef, refFrom, text }) => {
  return (
    <AlertDialog>
      <AlertDialogTrigger ref={myRef}></AlertDialogTrigger>
      <AlertDialogContent className='rounded-10 bg-white'>
        <AlertDialogHeader>
          <AlertDialogTitle>{text.title}</AlertDialogTitle>
          <AlertDialogDescription>{text.description}</AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter>
          <AlertDialogCancel className='group flex h-[35px] w-[120px] items-center justify-center gap-1 rounded bg-blue-500 text-white'>
            <div>{text.cancel}</div>
            <ArrowAnimated
              className={cn(
                'w-0 transition-all duration-200 ease-linear ',
                'group-hover:relative group-hover:w-6'
              )}
            />
          </AlertDialogCancel>
          <AlertDialogAction
            className='group flex h-[35px] w-[120px] items-center justify-center gap-1 rounded bg-blue-500 text-white'
            type='button'
            onClick={() => {
              if (refFrom.current) {
                ;(refFrom.current as HTMLFormElement).requestSubmit()
              }
            }}
          >
            <div>{text.submit}</div>
            <ArrowAnimated
              className={cn(
                'w-0 transition-all duration-200 ease-linear ',
                'group-hover:relative group-hover:w-6'
              )}
            />
          </AlertDialogAction>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  )
}

export default Alert
