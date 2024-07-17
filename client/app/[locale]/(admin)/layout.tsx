import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Админ',
  description:
    'Детский Сад Кашкалдак - административная панель для обработки документов одобренных заявлений',
}

export default function RootAdminLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return <div className='m-0'>{children}</div>
}
