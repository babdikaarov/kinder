'use client'

import { useEffect } from 'react'

interface RenderCountProps {
  count: number
}

const RenderCount: React.FC<RenderCountProps> = ({ count }) => {
  return (
    <div className='absolute left-5 top-32 bg-green-200 text-blue-600'>
      RenderCount: {count}
    </div>
  )
}

export default RenderCount
