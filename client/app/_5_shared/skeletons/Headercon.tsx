import { cn } from '@shared/index'

export function Headercon({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) {
  return (
    <div
      className={cn(
        'skeleton h-[60px] w-[200px] rounded-md ',
        className
      )}
      {...props}
    />
  )
}
