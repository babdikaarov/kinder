'use client'

import Lightbox from 'yet-another-react-lightbox'
import NextJsImage from './NextJsImage'
import 'yet-another-react-lightbox/styles.css'
interface ILightBoxProp {
  open: boolean
  close: (arg: boolean) => void
  images: myTS.ImageData[]
  index: number
}
const LightBox: React.FC<ILightBoxProp> = (props) => {
  const { open, close, images, index } = props
  const imagesWithSrcSet = images
    .map((item) => {
      return {
        src: item.src,
        width: 3840,
        height: 2560,
        srcSet: convertFormatsToArray(item.formats),
      }
    })
    .flat()
  return (
    <Lightbox
      controller={{
        closeOnBackdropClick: true,
        closeOnPullUp: true,
        closeOnPullDown: true,
      }}
      animation={{ fade: 300, swipe: 500 }}
      open={open}
      index={index}
      close={() => close(!open)}
      slides={imagesWithSrcSet}
      render={{ slide: NextJsImage }}
    />
  )
}

export default LightBox

function convertFormatsToArray(
  formats: Record<string, myTS.ImageFormat>
): myTS.ImageFormat[] {
  return Object.values(formats).map((format) => ({
    src: format.src,
    width: format.width,
    height: format.height,
  }))
}
