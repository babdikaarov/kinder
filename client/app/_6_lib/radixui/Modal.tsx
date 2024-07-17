'use client'

import * as Dialog from '@radix-ui/react-dialog'
import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'

interface ModalProps {
  children: React.ReactNode
}

const Modal: React.FC<ModalProps> = ({ children }) => {
  const [close, setClose] = useState(false)
  const router = useRouter()

  useEffect(() => {
    document.documentElement.style.overflow = 'hidden'
    return () => {
      document.documentElement.style.overflow = 'auto'
    }
  }, [])

  return (
    <>
      <Dialog.Root open={!close}>
        <Dialog.Portal>
          <div className='modalContainer fixed z-20 size-full  '>
            <Dialog.DialogContent
              onInteractOutside={(e) => {
                e.preventDefault()
                setClose(true)
                router.back()
              }}
              className='fixed left-1/2 top-1/2 w-full max-w-[900px] -translate-x-1/2  -translate-y-1/2 '
            >
              {children}
            </Dialog.DialogContent>
          </div>
        </Dialog.Portal>
      </Dialog.Root>
    </>
  )
}

export default Modal
