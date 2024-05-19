'use client'
import BlockRendererClient from './BlogRendererClient'
import { type BlocksContent } from '@strapi/blocks-react-renderer'
import { Arrow } from '@shared/index'
import Modal from './Modal'
import Blog from './Blog'
import BlogRendererClient from './BlogRendererClient'
import ShareLinks from '@/app/_5_shared/Links/ShareLinks'
interface BlogModalProps {
  locale: string
  content: {
    [key: string]: {
      title: string
      readonly post: BlocksContent
    }
  }
  shareText: {
    share: string
    copy: string
    copied: string
  }
}

const BlogModal: React.FC<BlogModalProps> = ({
  shareText,
  content,
  locale,
}) => {
  return (
    <Modal>
      <section className='boxShadow max-h-[400px] max-w-[900px] overflow-auto rounded-16 bg-white'>
        <Arrow className='fixed mt-2' />
        <div className='fixed right-0 mr-2 mt-3'>
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
