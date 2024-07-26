import { FormServer } from '@features/index'
import { getData } from '@entities/index'
import { Wrapper } from '@shared/index'
import { Metadata } from 'next'
import { Minicon } from '@/app/_5_shared/skeletons/Minicon'
import { Headercon } from '@/app/_5_shared/skeletons/Headercon'
import { Skeleton } from '@/app/_5_shared/skeletons/Skeleton'
interface pageProps {
  params: { locale: string; id: string }
}

export const metadata: Metadata = {
  title: 'Отправка документов',
  description: 'Страница отправки документов для администрации Кашкалдак',
}

const page: React.FC<pageProps> = async ({ params }) => {
  const instruction = await getData('/cms/api/instruction?populate=*', {
    cache: 'no-cache',
  })
  const { locale } = params
  return (
    <main className='relative  mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col items-center justify-between gap-32 font-poppins'>
      <Wrapper className=' m-auto flex  flex-col  items-start justify-center  gap-10 '>
        <article className='w-full text-center'>
          <p className='text-left text-fs-6 text-[#367AE1]'>
            {instruction[locale]}
          </p>
        </article>
        <FormServer locale={locale} />
      </Wrapper>
    </main>
  )
}

export default page
