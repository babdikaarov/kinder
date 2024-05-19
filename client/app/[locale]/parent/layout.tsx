interface layoutProps {
  children: React.ReactNode
  modal: React.ReactNode
}

const layout: React.FC<layoutProps> = ({ children, modal }) => {
  return (
    <main className='relative mb-32 mt-24 flex w-full max-w-wrapperLimit flex-1 flex-col items-center justify-between gap-32 font-poppins '>
      {children}
      {modal}
    </main>
  )
}

export default layout
