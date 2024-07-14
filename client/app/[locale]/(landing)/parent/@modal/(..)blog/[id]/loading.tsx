import { LoaderCircle } from 'lucide-react'

interface LoadingProps {}

const Loading: React.FC<LoadingProps> = ({}) => {
  return (
    <div className='m-auto animate-spin'>
      <LoaderCircle className='size-28 animate-spin' />
    </div>
  )
}

export default Loading
