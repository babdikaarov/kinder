import { Skeleton } from '@/app/_5_shared/skeletons/Skeleton'

interface LoadingProps {}

const Loading: React.FC<LoadingProps> = ({}) => {
  return (
    <div className='absolute bottom-0 left-0 right-0 top-0 z-20  flex items-center justify-center bg-theme-bg/40 backdrop-blur-sm'>
      <Skeleton className='size-full max-h-[600px] max-w-[900px]' />
    </div>
  )
}

export default Loading
