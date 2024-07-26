import { getData } from '@entities/index'
import Image from 'next/image'
import Link from 'next/link'
interface LogoProps extends React.HTMLAttributes<HTMLImageElement> {
  to: string
  locale: string
}

const Logo: React.FC<LogoProps> = async ({ to, locale, ...rest }) => {
  const img = await getData('/cms/api/logo?&populate=*')

  return (
    <Link href={to} locale={locale}>
      <button>
        <Image
          width={50}
          height={50}
          {...rest}
          src={img.url}
          alt={img.name ?? 'main logo'}
        />
      </button>
    </Link>
  )
}

export default Logo
