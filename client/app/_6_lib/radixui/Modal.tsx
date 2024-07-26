'use client'

import * as Dialog from '@radix-ui/react-dialog'
import { useEffect, useRef, useState } from 'react'
import { useRouter } from 'next/navigation'

interface ModalProps {
  children: React.ReactNode
}

const Modal: React.FC<ModalProps> = ({ children }) => {
  const router = useRouter()
  const [open, setOpen] = useState(false)

  return (
    <Dialog.Root open={!open} onOpenChange={setOpen}>
      <Dialog.Portal>
        <Dialog.Overlay className='fixed bottom-0 left-0 right-0 top-0 z-50 h-svh bg-theme-bg/40 backdrop-blur-sm'>
          <Dialog.DialogContent
            onInteractOutside={(e) => {
              router.back()
            }}
            className='fixed left-1/2 top-1/2 z-30 w-full max-w-[900px] -translate-x-1/2  -translate-y-1/2 '
          >
            {children}
          </Dialog.DialogContent>
        </Dialog.Overlay>
      </Dialog.Portal>
    </Dialog.Root>
  )
}

export default Modal
