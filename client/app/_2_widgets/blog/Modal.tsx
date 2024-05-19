'use client'

import * as Dialog from '@radix-ui/react-dialog'
import { useEffect, useState, type FC, type ReactNode } from 'react'
import { useRouter } from 'next/navigation'

interface ModalProps {
  children: ReactNode
}

const Modal: FC<ModalProps> = ({ children }) => {
  const router = useRouter()
  const handleOnOpenChange = (open: boolean) => {
    if (!open) {
      router.back()
    }
  }
  useEffect(() => {
    document.documentElement.style.overflow = 'hidden'
    return () => {
      document.documentElement.style.overflow = 'auto'
    }
  }, [])

  return (
    <>
      <Dialog.Root open onOpenChange={handleOnOpenChange}>
        <Dialog.Portal>
          <div className='modalContainer fixed z-20 size-full  '>
            <Dialog.DialogContent className='fixed left-1/2 top-1/2 w-full max-w-[900px] -translate-x-1/2  -translate-y-1/2 '>
              {children}
            </Dialog.DialogContent>
          </div>
        </Dialog.Portal>
      </Dialog.Root>
    </>
  )
}

export default Modal
