import { LoaderCircle } from "lucide-react";

interface LoadingProps {}

const Loading: React.FC<LoadingProps> = ({}) => {
  return (
    <div className='absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2'>
      <LoaderCircle className='size-28 animate-spin' />
    </div>
  )
};

export default Loading;
