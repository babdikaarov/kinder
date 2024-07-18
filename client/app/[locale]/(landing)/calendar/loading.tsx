import { Headercon } from '@/app/_5_shared/skeletons/Headercon'
import { Minicon } from '@/app/_5_shared/skeletons/Minicon'
import { Skeleton } from '@/app/_5_shared/skeletons/Skeleton'

interface Props {}

const Loading: React.FC<Props> = ({}) => {
  return (
    <main className='relative mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col justify-center'>
      <div className='relative flex w-full items-center justify-center'>
        <Minicon className='absolute left-0' />
        <Headercon className='' />
      </div>
      <Headercon className='relative left-0 mt-6' />
      <Skeleton className='mt-3 h-[100px] w-full' />
      <Skeleton className='mt-1 h-[500px] w-full' />
    </main>
  )
}
export default Loading
