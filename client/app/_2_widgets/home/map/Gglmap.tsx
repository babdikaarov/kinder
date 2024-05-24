'use client'

import { parseDocument } from 'htmlparser2'
interface GglmapProps {
  shareLink: string
}

const Gglmap: React.FC<GglmapProps> = ({ shareLink }) => {
  const extractAttributes = (str: string) => {
    const document = parseDocument(str)
    const iframe = document.children.find(
      (element) => (element as any).name === 'iframe'
    )

    if (!iframe || !(iframe as any).attribs) return null

    return (iframe as any).attribs
  }
  const iframeAttributes = extractAttributes(shareLink)
  return (
    <iframe
      className='min-w-[360px] flex-1 rounded-10 xsm:min-w-[225px]'
      src={iframeAttributes.src}
      height='173'
      allowFullScreen={false}
      loading='lazy'
      referrerPolicy='no-referrer-when-downgrade'
    ></iframe>
  )
}

export default Gglmap
