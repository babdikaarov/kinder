interface BurgerIconProps {}

const BurgerIcon: React.FC<BurgerIconProps> = ({}) => {
  return (
    <svg className='burgerSVG fill-black' viewBox='0 0 100 100' width='40'>
      <rect
        // top
        className='line top'
        width='80'
        height='10'
        x='10'
        y='25'
        rx='5'
      ></rect>
      <rect
        // middle
        className='line middle'
        width='80'
        height='10'
        x='10'
        y='45'
        rx='5'
      ></rect>
      <rect
        //bottom
        className='line bottom'
        width='80'
        height='10'
        x='10'
        y='65'
        rx='5'
      ></rect>
    </svg>
  )
}

export default BurgerIcon
