import { cn } from '@/app/_5_shared'
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

interface HomePageProps {
  i: string
}

const HomePage: React.FC<HomePageProps> = ({ i }) => {
  return (
    <main
      className={cn(
        'mt-24 flex w-full lg:gap-24 flex-1 flex-col items-center justify-between gap-32'
      )}
    >
      <Hero i={i} />
      <Groups i={i} />
      <About i={i} />
      <WhyUs i={i} />
      <CalendarReference i={i} />
      <Programs i={i} />
      <GalleryInfo i={i} />
      <Map i={i} />
    </main>
  )
}

export default HomePage
