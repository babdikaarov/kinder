import { Skeleton } from '@/app/_5_shared/skeletons/Skeleton'

interface Props {}

const Loading: React.FC<Props> = ({}) => {
  return (
    <main className='relative  mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col items-center justify-between gap-32 font-poppins'>
      <div className='w-full'>
        <Skeleton className='mb-1 h-[30px] w-full' />
        <Skeleton className='mb-1 h-[30px] w-full' />
        <Skeleton className='mb-12 h-[30px] w-[40%]' />
        {new Array(7).fill(0).map((_, i) => (
          <Skeleton
            key={i}
            className='relative left-[41%] mb-6 min-h-[54px] w-full max-w-[600px] -translate-x-1/2 lgExtra:left-1/2'
          />
        ))}
      </div>
    </main>
  )
}

export default Loading
