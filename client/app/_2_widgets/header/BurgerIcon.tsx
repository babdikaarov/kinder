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
/* 
 <line
        // top
        className='line top'
        x1='10'
        y1='25'
        x2='90'
        y2='25'
        stroke='black'
        strokeWidth='10'
        strokeLinecap='round'
      />
      <line
        // middle
        className='line middle'
        x1='10'
        y1='50'
        x2='90'
        y2='50'
        stroke='black'
        strokeWidth='10'
        strokeLinecap='round'
      />
      <line
        // bottom
        className='line bottom'
        x1='10'
        y1='75'
        x2='90'
        y2='75'
        stroke='black'
        strokeWidth='10'
        strokeLinecap='round'
      />
*/
