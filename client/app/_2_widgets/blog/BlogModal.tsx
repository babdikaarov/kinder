'use client'
import { Arrow, ShareLinks } from '@shared/index'
import Modal from '@lib/radixui/Modal'
import BlogRendererClient from '@lib/strapi/BlogRendererClient'

const BlogModal: React.FC<myTS.BlogProps> = ({
  shareText,
  content,
  locale,
}) => {
  return (
    <Modal>
      <section className='boxShadow max-h-[400px] max-w-[900px] overflow-auto rounded-16 bg-white'>
        <Arrow className='fixed mt-5' />
        <div className='fixed right-0 mr-2 mt-10'>
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
