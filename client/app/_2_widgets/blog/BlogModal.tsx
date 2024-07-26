'use client'
import { ShareLinks } from '@shared/index'
import Modal from '@lib/radixui/Modal'
import BlogRendererClient from '@lib/strapi/BlogRendererClient'
import { useRouter } from 'next/navigation'
import { ChevronLeft } from 'lucide-react'

const BlogModal: React.FC<myTS.BlogProps> = ({
  shareText,
  content,
  locale,
}) => {
  const router = useRouter()
  return (
    <Modal>
      <section className='boxShadow max-h-[70dvh] max-w-[900px] overflow-auto rounded-16 bg-white'>
        <button
          className='fixed mt-5'
          onClick={() => {
            router.back()
          }}
        >
          <ChevronLeft className='size-[40px]' />
        </button>

        <div className='fixed right-0 mr-2 mt-6'>
          <ShareLinks
            locale={locale}
            text={shareText}
            title={content[locale].title}
          />
        </div>
        <article className='m-auto max-h-[950px] max-w-[820px] p-5 '>
          <h2 className={'text-center font-poppins text-fs-1 font-bold'}>
            {content[locale].title}
          </h2>
          <BlogRendererClient content={content} />
        </article>
      </section>
    </Modal>
  )
}

export default BlogModal
