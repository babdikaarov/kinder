import { Form } from '@/app/_3_features'
import { getData } from '@/app/_4_entities'
import { Arrow, Wrapper } from '@shared/index'
import { getTranslations } from 'next-intl/server'

interface AdminPageProps extends myTS.I {}

const AdminPage: React.FC<AdminPageProps> = async ({ i }) => {
  const instruction = await getData('/api/instruction?populate=*', {
    cache: 'default',
  })

  return (
    <main className='relative mb-32 mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col items-center justify-between gap-32 font-poppins'>
      <Wrapper className=' m-auto flex  flex-col  items-start justify-center  gap-[10vh] '>
        {/* <Arrow className='absolute left-0 top-0' tomain /> */}
        <article className='w-full text-center'>
          <p className='text-dark-700'>{instruction[i]}</p>
        </article>
        <Form i={i} />
      </Wrapper>
    </main>
  )
}

export default AdminPage
