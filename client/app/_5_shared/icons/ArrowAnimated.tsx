interface ArrowAnimatedProps extends React.SVGProps<SVGSVGElement> {}

const ArrowAnimated: React.FC<ArrowAnimatedProps> = ({ className }) => {
  return (
    <svg
      xmlns='http://www.w3.org/2000/svg'
      width='34'
      height='34'
      viewBox='0 0 24 24'
      fill='#292929'
      stroke='currentColor'
      strokeWidth='2'
      strokeLinecap='round'
      strokeLinejoin='round'
      className={className}
    >
      <path d='M18 8L22 12L18 16' />
      <path d='M2 12H22' />
    </svg>
  )
}

export default ArrowAnimated
