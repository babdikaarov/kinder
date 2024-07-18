import { cn } from '@/app/_5_shared'
import { Headercon } from '@/app/_5_shared/skeletons/Headercon'
import { Minicon } from '@/app/_5_shared/skeletons/Minicon'
import { Skeleton } from '@/app/_5_shared/skeletons/Skeleton'

interface Props {}

const Loading: React.FC<Props> = ({}) => {
  return (
    <>
      {/* <main className='relative  mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col items-center justify-between gap-14 font-poppins'> */}
      <Minicon className='absolute left-0 top-3' />
      <Headercon className='relative top-3' />
      <div className='relative -top-[70px] w-full'>
        <div
          className={cn(
            ' grid w-full grid-cols-3 gap-x-5 gap-y-11',
            'mdExtra:grid-cols-2',
            'smExtra:grid-cols-1'
          )}
        >
          {new Array(6).fill(0).map((_, i) => (
            <div
              key={i}
              className='flex h-[523px] w-full flex-col justify-between '
            >
              <Skeleton className='size-full max-h-[413px] rounded-10  object-cover' />
              <Skeleton className='h-[30px] w-full ' />
              <div className='relative flex items-center justify-between'>
                <Skeleton className='h-[44px] w-[208px] ' />
                <Minicon />
              </div>
            </div>
          ))}
        </div>
      </div>
    </>
  )
}

export default Loading
