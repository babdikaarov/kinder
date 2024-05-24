import { Arrow } from '@/app/_5_shared'
import BlogRendererClient from './BlogRendererClient'
import { type BlocksContent } from '@strapi/blocks-react-renderer'
import ShareLinks from '@/app/_5_shared/Links/ShareLinks'

interface BlogProps {
  content: {
    [key: string]: {
      title: string
      readonly post: BlocksContent
    }
  }
  locale: string
  shareText: {
    share: string
    copy: string
    copied: string
  }
}

const Blog: React.FC<BlogProps> = ({ shareText, content, locale }) => {
  return (
    <section className='max-w-[90%]'>
      <Arrow className='absolute left-0 top-3' tomain />
      <div className='absolute right-0 mr-2 mt-3'>
        <ShareLinks
          locale={locale}
          text={shareText}
          title={content[locale].title}
        />
      </div>
      <article>
        <h2 className={'text-center font-poppins text-fs-1 font-bold'}>
          {content[locale].title}
        </h2>
        <BlogRendererClient content={content} />
      </article>
    </section>
  )
}

export default Blog
