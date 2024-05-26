'use client'

// swiper.js
import { Swiper, SwiperSlide } from 'swiper/react'
import { FreeMode, Mousewheel, Navigation } from 'swiper/modules'
import 'swiper/css'
import 'swiper/css/navigation'
import { ChevronLeft, ChevronRight } from 'lucide-react'
import Image from 'next/image'
// import './swiperPrograms.css'

interface SwiperProgramsProps {
  locale: string
  data: any
}

const SwiperPrograms: React.FC<SwiperProgramsProps> = ({ locale, data }) => {
  return (
    <>
      <Swiper
        spaceBetween={40}
        slidesPerView={'auto'}
        centerInsufficientSlides
        freeMode
        mousewheel={{
          forceToAxis: true,
        }}
        modules={[Mousewheel, Navigation, FreeMode]}
        navigation={{ nextEl: '#nextSlide', prevEl: '#prevSlide' }}
        // className='first:bg-red-300'
      >
        {data.map((item: any, index: number) => (
          <SwiperSlide key={index} className='mt-12 w-[222px]'>
            <article about={item[locale].title} className={'text-center'}>
              <details>
                <summary>
                  <Image
                    className='aspect-square min-w-[200px] max-w-[200px]'
                    src={item.image.src}
                    alt={item.title ?? 'program icon'}
                    width={200}
                    height={200}
                    style={{
                      width: 'auto',
                      height: 'auto',
                      objectFit: 'cover',
                    }}
                  />
                  <p className='text-fs-lg font-semibold'>
                    {item[locale].title}
                  </p>
                </summary>
                <p className='relative z-10  max-w-[200px]  rounded-10 border border-black bg-blue-500 p-1 text-fs-base  tracking-wide text-white '>
                  {item[locale].description}
                </p>
              </details>
            </article>
          </SwiperSlide>
        ))}
      </Swiper>
      <div className='absolute right-[0px] w-fit'>
        <button
          aria-label='navigation'
          id='prevSlide'
          // className='absolute left-0 top-1/2 -translate-y-1/2'
        >
          <ChevronLeft className='mr-1 size-[40px]' />
        </button>
        <button
          aria-label='navigation'
          id='nextSlide'
          // className='absolute right-0 top-1/2 -translate-y-1/2'
        >
          <ChevronRight className='size-[40px]' />
        </button>
      </div>
    </>
  )
}

export default SwiperPrograms
