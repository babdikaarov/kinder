import { cn } from '@/app/_5_shared'
import { Headercon } from '@/app/_5_shared/skeletons/Headercon'
import { Minicon } from '@/app/_5_shared/skeletons/Minicon'
import { Skeleton } from '@/app/_5_shared/skeletons/Skeleton'

interface Props {}

const Loading: React.FC<Props> = ({}) => {
  return (
    <main className='relative  mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col items-center justify-between gap-16 font-poppins'>
      <Minicon className='absolute left-0 top-3' />
      <Headercon className='relative top-3' />
      <div
        className={cn(
          ' grid w-full auto-rows-[351px] grid-cols-4 grid-rows-[351px] gap-5',
          'lgExtra:grid-cols-3',
          'lg:grid-cols-3',
          'mdExtra:grid-cols-2',
          'smExtra:grid-cols-1'
        )}
      >
        {new Array(8).fill(0).map((_, i) => (
          <Skeleton
            key={i}
            className='block size-full min-h-full min-w-full rounded-10'
          ></Skeleton>
        ))}
      </div>
    </main>
  )
}
export default Loading
