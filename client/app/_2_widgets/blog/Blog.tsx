import { Arrow, ShareLinks } from '@shared/index'
import BlogRendererClient from '@lib/strapi/BlogRendererClient'

const Blog: React.FC<myTS.BlogProps> = ({ shareText, content, locale }) => {
  return (
    <section className='max-w-[90%]'>
      <Arrow className='absolute left-0 top-3' href='/' locale={locale} />
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
