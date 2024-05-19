'use client'

import { LightBox } from '@widgets/index'
import { Wrapper, cn } from '@shared/index'
import Image from 'next/image'
import { useEffect, useState } from 'react'
import './gallery.css'

interface GalleryProps {
  data: DataEntry[]
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
    large: ImageFormat
    small: ImageFormat
    medium: ImageFormat
    thumbnail: ImageFormat
  }
}

export interface DataEntry {
  data: ImageData[]
}

const GalleryClient: React.FC<GalleryProps> = ({ data, header }) => {
  const [isOpen, setIsOpen] = useState(false)

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
          {data.map(({ data }) => {
            return data.map((image) => (
              <article key={image.id}>
                <Image
                  className='size-full object-cover rounded-10 hover:cursor-pointer'
                  onClick={() => setIsOpen(true)}
                  src={image.src}
                  alt={image.alt ?? 'galley image'}
                  width={289}
                  height={351}
                  // style={{
                  //   width: 'auto',
                  //   height: 'auto',
                  //   objectFit: 'cover',
                  // }}
                />
              </article>
            ))
          })}
        </div>
        <LightBox open={isOpen} close={setIsOpen} images={data} />
      </Wrapper>
    </>
  )
}

export default GalleryClient
