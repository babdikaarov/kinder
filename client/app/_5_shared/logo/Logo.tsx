import { getData } from '@/app/_4_entities'
import Image from 'next/image'
interface LogoProps extends React.HTMLAttributes<HTMLImageElement> {}

const Logo: React.FC<LogoProps> = async ({ ...rest }) => {
  const img = await getData('/api/logo?&populate=*')

  return (
    <Image
      width={50}
      height={50}
      {...rest}
      src={img.url}
      alt={img.name ?? 'main logo'}
    />
  )
}

export default Logo
