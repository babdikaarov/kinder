import { cn } from '@/app/_5_shared'

interface AddSVGProps {
  isAllDocsChoosen: boolean
  validDocsForm: boolean
}

const AddSVG: React.FC<AddSVGProps> = ({ isAllDocsChoosen, validDocsForm }) => {
  return (
    <svg
      className={cn(
        'addFileSVG overflow-visible rounded  fill-white',
        isAllDocsChoosen ? 'bg-slate-400' : ''
      )}
      viewBox='0 0 100 100'
      width='32'
      data-state={
        validDocsForm && isAllDocsChoosen ? 'valid' : 'yet-to-be-valid'
      }
    >
      <rect
        // horizontal rect
        className={cn('horizontal', 'rect')}
        width='80'
        height='10'
        x='10'
        y='45'
        rx='5'
      ></rect>
      <rect
        // vertical rect
        className={cn('vertical', 'rect')}
        width='10'
        height='80'
        x='45'
        y='10'
        rx='5'
      ></rect>
    </svg>
  )
}

export default AddSVG
