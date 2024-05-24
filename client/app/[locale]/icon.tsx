import { ImageResponse } from 'next/og'
import { getData } from '../_4_entities'

// Image metadata
export const size = {
  width: 32,
  height: 32,
}
export const contentType = 'image/png'

// Image generation
export default async function Icon() {
  const img = await getData('/api/logo?&populate=*')

  return new ImageResponse(
    (
      // eslint-disable-next-line @next/next/no-img-element
      <img
        src={img.url}
        alt={img.name ?? 'main logo'}
        width='100%'
        height='100%'
      />
    ),
    {
      ...size,
    }
  )
}
