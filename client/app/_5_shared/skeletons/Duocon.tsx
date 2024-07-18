import { Skeleton } from './Skeleton'

interface DuoconProps {}

export const Duocon: React.FC<DuoconProps> = ({}) => {
  return (
    <div className='flex justify-between gap-5 md:flex-col'>
      <Skeleton className=' h-[350px] w-full md:h-[180px]' />
      <div className='flex w-full flex-col justify-between gap-1'>
        {new Array(10).fill(0).map((_, i) => (
          <Skeleton key={i} className='block h-[30px] w-full md:hidden' />
        ))}
        {new Array(5).fill(0).map((_, i) => (
          <Skeleton key={i} className='hidden  h-[24px] w-full md:block' />
        ))}
      </div>
    </div>
  )
}
