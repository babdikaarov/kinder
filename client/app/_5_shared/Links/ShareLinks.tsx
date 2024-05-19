'use client'

import { Share2, X } from 'lucide-react'
import { useEffect, useState } from 'react'
import {
  FacebookIcon,
  FacebookShareButton,
  TelegramIcon,
  TelegramShareButton,
  WhatsappIcon,
  WhatsappShareButton,
} from 'react-share'
import * as Dialog from '@radix-ui/react-dialog'

interface ShareLinksProps {
  locale: string
  id?: number
  title: string
  text: {
    share: string
    copy: string
    copied: string
  }
}

const ShareLinks: React.FC<ShareLinksProps> = ({ id, title, text, locale }) => {
  const [href, setHref] = useState('')
  const [copied, setCopied] = useState(false)

  const handleCopy = () => {
    navigator.clipboard.writeText(href)
    setCopied(true)
    setTimeout(() => setCopied(false), 2000) // Reset copied state after 2 seconds
  }

  useEffect(() => {
    let url = ''
    if (id) {
      url = `${window.location.origin}/${locale}/blog/${id}`
    } else {
      url = window.location.href
    }
    setHref(url)
    const markdown = `[Video Link](${url})`

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return (
    <>
      <Dialog.Root>
        <Dialog.Trigger>
          <Share2 className='relative'></Share2>
        </Dialog.Trigger>
        <Dialog.Portal>
          <Dialog.Overlay className='data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0  z-50 bg-theme-bg/10 backdrop-blur-sm ' />
          <Dialog.Content className='data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-6 rounded-10 border bg-theme-bg  p-6 shadow-lg duration-200 sm:rounded-lg'>
            <div className='flex flex-col gap-6'>
              <div className='relative flex h-[54px] min-w-full items-center justify-end overflow-hidden rounded border-[0.5px] border-dark-600 bg-slate-200 bg-transparent  text-fs-6'>
                <p className=' absolute left-2  text-nowrap'>{href}</p>
                <button
                  onClick={handleCopy}
                  className='z-10 h-full bg-theme-bg'
                >
                  <p className='mx-1 rounded-full bg-blue-500 px-2 text-white'>
                    {copied ? text.copied : text.copy}
                  </p>
                </button>
              </div>
              <div className='flex items-center justify-between gap-3'>
                <p className='text-fs-6'>
                  {text.share}: {title}
                </p>
                <div className='flex gap-2 '>
                  <TelegramShareButton url={href}>
                    <TelegramIcon size={32} borderRadius={10} />
                  </TelegramShareButton>
                  <FacebookShareButton url={href}>
                    <FacebookIcon size={32} borderRadius={10} />
                  </FacebookShareButton>
                  <WhatsappShareButton url={href}>
                    <WhatsappIcon size={32} borderRadius={10} />
                  </WhatsappShareButton>
                </div>
              </div>
            </div>
            <Dialog.Close
              className='absolute right-0 top-0 hover:cursor-pointer'
              asChild
            >
              <X />
            </Dialog.Close>
          </Dialog.Content>
        </Dialog.Portal>
      </Dialog.Root>
    </>
  )
}

export default ShareLinks
