import Image from 'next/image'
import Link from 'next/link'

export default function NotFound() {
  return (
    <main className='flex h-svh flex-col  items-center justify-center bg-theme-bg'>
      <Link href='/'>
        <div className='flex h-20   items-center  justify-between *:hover:animate-none *:hover:stroke-emerald-400'>
          <svg
            xmlns='http://www.w3.org/2000/svg'
            width='44'
            height='44'
            viewBox='0 0 24 24'
            fill='none'
            stroke='currentColor'
            strokeWidth='2'
            strokeLinecap='round'
            strokeLinejoin='round'
            className='flex-1 '
          >
            <path d='M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8' />
            <path d='M3 10a2 2 0 0 1 .709-1.528l7-5.999a2 2 0 0 1 2.582 0l7 5.999A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z' />
          </svg>
          <svg
            xmlns='http://www.w3.org/2000/svg'
            width='44'
            height='44'
            viewBox='0 0 24 24'
            fill='none'
            stroke='currentColor'
            strokeWidth='2'
            strokeLinecap='round'
            strokeLinejoin='round'
            className='flex-1 animate-bounceLeft '
          >
            <circle cx='12' cy='12' r='10' />
            <path d='M16 12H8' />
            <path d='m12 8-4 4 4 4' />
          </svg>
        </div>
        <Image alt='404' src={'/404.png'} width='300' height='300' />
      </Link>
      <p className='max-w-600 text-center text-fs-lg'>
        Страница не найдена, либо Возможные неполадки с сервером, попробуйте
        нажать кнопку сверху на картинку{' '}
      </p>
    </main>
  )
}
