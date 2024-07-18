import { cn } from '@shared/index'

export function Minicon({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) {
  return (
    <div
      className={cn('skeleton size-12 rounded-full ', className)}
      {...props}
    />
  )
}
