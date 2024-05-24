'use client'

import { LightBox } from '@widgets/index'
import { Wrapper, cn } from '@shared/index'
import Image from 'next/image'
import { useEffect, useState } from 'react'
import './gallery.css'

interface GalleryProps {
  data: ImageData[]
  header: string
}
export interface ImageFormat {
  src: string
  width: number
  height: number
}

export interface ImageData {
  id: number
  alt: string | null
  src: string
  formats: {
    large?: ImageFormat
    small?: ImageFormat
    medium?: ImageFormat
    thumbnail?: ImageFormat
  }
}

export type DataEntry = {
  data: ImageData[]
}

const GalleryClient: React.FC<GalleryProps> = ({ data, header }) => {
  const [isOpen, setIsOpen] = useState(false)
  const [index, setIndex] = useState(0)

  const handleOpen = (i: number) => {
    // console.log(i, 'handleopen')

    setIndex(i)
    setIsOpen(true)
  }
  useEffect(() => {
    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.code === 'Space') {
        setIsOpen(!isOpen)
      }
    }

    document.addEventListener('keydown', handleKeyDown)

    return () => {
      document.removeEventListener('keydown', handleKeyDown)
    }
  }, [isOpen])

  return (
    <>
      <Wrapper header={header} id='Gallery' className='w-full'>
        <div
          className={cn(
            'mt-10 grid auto-rows-[351px] grid-cols-4 grid-rows-[351px] gap-5',
            'lgExtra:grid-cols-3',
            'lg:grid-cols-3',
            'mdExtra:grid-cols-2',
            'smExtra:grid-cols-1'
          )}
        >
          {data.map((image, i) => (
            <article key={image.id} onClick={() => handleOpen(i)}>
              <Image
                className='size-full rounded-10 object-cover hover:cursor-pointer'
                src={image.src}
                alt={image.alt ?? 'galley image'}
                width={289}
                height={351}
                style={{
                  width: 'auto',
                  height: 'auto',
                  objectFit: 'cover',
                }}
              />
            </article>
          ))}
        </div>
        <LightBox index={index} open={isOpen} close={setIsOpen} images={data} />
      </Wrapper>
    </>
  )
}

export default GalleryClient
