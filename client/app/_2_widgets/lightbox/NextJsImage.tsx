'use client'

import { cn } from '@/app/_5_shared'
import Image, { StaticImageData } from 'next/image'
import {
  RenderSlideProps,
  isImageFitCover,
  useLightboxProps,
  useLightboxState,
  isImageSlide,
  Slide,
} from 'yet-another-react-lightbox'

function isNextJsImage(slide: Slide): slide is StaticImageData {
  return (
    isImageSlide(slide) &&
    typeof slide.width === 'number' &&
    typeof slide.height === 'number'
  )
}

export default function NextJsImage({ slide, offset, rect }: RenderSlideProps) {
  const {
    on: { click },
    carousel: { imageFit },
  } = useLightboxProps()

  const { currentIndex } = useLightboxState()

  const cover = isImageSlide(slide) && isImageFitCover(slide, imageFit)

  if (!isNextJsImage(slide)) return undefined

  const width = !cover
    ? Math.round(
        Math.min(rect.width, (rect.height / slide.height) * slide.width)
      )
    : rect.width

  const height = !cover
    ? Math.round(
        Math.min(rect.height, (rect.width / slide.width) * slide.height)
      )
    : rect.height

  return (
    <div
      style={{ position: 'relative', width, height }}
      className='lg:h-5/6 lg:w-5/6 smExtra:h-full smExtra:w-full landscape:lg:h-full'
    >
      <Image
        fill
        alt='slide image view'
        src={slide}
        loading='eager'
        draggable={false}
        placeholder={slide.blurDataURL ? 'blur' : undefined}
        className={cn(cover ? 'object-cover' : 'object-contain', {
          'cursor-pointer': click,
        })}
        sizes={`${Math.ceil((width / window.innerWidth) * 100)}vw`}
        onClick={
          offset === 0 ? () => click?.({ index: currentIndex }) : undefined
        }
      />
    </div>
  )
}
