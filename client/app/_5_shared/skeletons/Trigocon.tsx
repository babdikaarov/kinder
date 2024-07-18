import { Skeleton } from './Skeleton'

interface TrigoconProps {}

export const Trigocon: React.FC<TrigoconProps> = ({}) => {
  return (
    <div className='flex justify-around gap-12 lg:flex-col lg:items-center'>
      <div className='flex w-full flex-col space-y-3 lg:max-w-96 '>
        <Skeleton className='h-[225px] w-full rounded-xl lg:h-[150px]' />
        <div className='space-y-2'>
          <Skeleton className='h-4 w-[250px]' />
          <Skeleton className='h-4 w-[200px]' />
        </div>
      </div>
      <div className='flex w-full flex-col space-y-3 lg:hidden '>
        <Skeleton className='h-[225px] w-full rounded-xl' />
        <div className='space-y-2'>
          <Skeleton className='h-4 w-[250px]' />
          <Skeleton className='h-4 w-[200px]' />
        </div>
      </div>
      <div className='flex w-full flex-col space-y-3 lg:hidden '>
        <Skeleton className='h-[225px] w-full rounded-xl' />
        <div className='space-y-2'>
          <Skeleton className='h-4 w-[250px]' />
          <Skeleton className='h-4 w-[200px]' />
        </div>
      </div>
    </div>
  )
}
