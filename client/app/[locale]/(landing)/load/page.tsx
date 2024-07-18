import { Duocon } from '@/app/_5_shared/skeletons/Duocon'
import { Headercon } from '@/app/_5_shared/skeletons/Headercon'
import { Skeleton } from '@/app/_5_shared/skeletons/Skeleton'
import { Trigocon } from '@/app/_5_shared/skeletons/Trigocon'
interface LoadingProps {}

const Loading: React.FC<LoadingProps> = ({}) => {
  return (
    <main className='mt-24 flex w-full flex-1 flex-col items-center justify-between gap-32 lg:gap-24'>
      <div className='w-full max-w-wrapperLimit space-y-16'>
        <Skeleton className=' h-[500px] w-full lg:h-[400px]' />
        <Headercon className=' relative left-1/2 mb-10 -translate-x-1/2' />
        <Trigocon />
        <Headercon className=' relative left-1/2 mb-10 -translate-x-1/2' />
        <Duocon />
        <Headercon className=' relative left-1/2 mb-10 -translate-x-1/2' />
        <Trigocon />
        <Headercon className=' relative left-1/2 mb-10 -translate-x-1/2' />
        <Trigocon />
        <Headercon className=' relative left-1/2 mb-10 -translate-x-1/2' />
        <Duocon />
      </div>
    </main>
  )
}

export default Loading
