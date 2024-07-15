import { FormServer } from '@/app/_3_features'
import { getData } from '@/app/_4_entities'
import { Wrapper } from '@shared/index'
interface pageProps {
  params: { locale: string; id: string }
}
const page: React.FC<pageProps> = async ({ params }) => {
  const instruction = await getData('/api/instruction?populate=*', {
    cache: 'default',
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
