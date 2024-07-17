import { cn } from '@shared/index'
import {
  About,
  CalendarReference,
  GalleryInfo,
  Groups,
  Hero,
  Programs,
  WhyUs,
  Map,
} from '@widgets/index'
interface PageProps {
  params: { locale: string }
}

const Page: React.FC<PageProps> = ({ params }) => {
  const { locale } = params
  return (
    <main
      className={cn(
        'mt-24 flex w-full flex-1 flex-col items-center justify-between gap-32 lg:gap-24'
      )}
    >
      <Hero locale={locale} />
      <Groups locale={locale} />
      <About locale={locale} />
      <WhyUs locale={locale} />
      <CalendarReference locale={locale} />
      <Programs locale={locale} />
      <GalleryInfo locale={locale} />
      <Map locale={locale} />
    </main>
  )
}

export default Page
