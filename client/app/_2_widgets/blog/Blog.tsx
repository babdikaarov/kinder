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
      <Arrow className='absolute left-0' tomain />
      <div className='absolute right-0 mr-2 mt-2'>
        <ShareLinks
          locale={locale}
          text={shareText}
          title={content[locale].title}
        />
      </div>
      <article>
        <BlogRendererClient content={content} />
      </article>
    </section>
  )
}

export default Blog
