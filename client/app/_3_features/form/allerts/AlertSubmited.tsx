'use client'

import { ArrowAnimated, cn } from '@shared/index'
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from '@lib/radixui/AlertLib'

interface AlertProps {
  myRef: React.MutableRefObject<null>
  resetForm: () => void
  text: {
    title: string
    description: string
    close: string
  }
}

const Alert: React.FC<AlertProps> = ({ myRef, resetForm, text }) => {
  return (
    <AlertDialog>
      <AlertDialogTrigger ref={myRef} className='absolute'></AlertDialogTrigger>
      <AlertDialogContent className='rounded-10 bg-white'>
        <AlertDialogHeader>
          <AlertDialogTitle>{text.title}</AlertDialogTitle>
          <AlertDialogDescription>{text.description}</AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter>
          <AlertDialogAction
            className='group flex h-[35px] w-[120px] items-center justify-center gap-1 rounded bg-blue-500 text-white'
            type='button'
            onClick={resetForm}
          >
            <div>{text.close}</div>
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
