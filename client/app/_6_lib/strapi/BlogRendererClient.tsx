'use client'

import Image from 'next/image'
import {
  BlocksRenderer,
  type BlocksContent,
} from '@strapi/blocks-react-renderer'
import { useParams } from 'next/navigation'
interface BlogRendererClientProps {
  content: {
    [key: string]: {
      title: string
      readonly post: BlocksContent
    }
  }
}

const BlogRendererClient: React.FC<BlogRendererClientProps> = ({ content }) => {
  const { locale } = useParams<{ locale: string }>()
  if (!content) return null

  const post = content[locale].post
  return (
    <BlocksRenderer
      content={post}
      modifiers={{
        code: ({ children }) => (
          <code className='rounded bg-gray-100 p-1'>{children}</code>
        ),
      }}
      blocks={{
        list: ({ children, format }) => {
          return format === 'ordered' ? (
            <ol className='ml-20 mt-3 list-inside list-decimal'>{children}</ol>
          ) : (
            <ul className='ml-20 mt-3 list-inside list-disc'>{children}</ul>
          )
        },
        paragraph: ({ children }) => (
          <p className='my-4 break-words text-fs-base'>{children}</p>
        ),
        quote: ({ children }) => (
          <blockquote className='my-4 border-l-4 border-gray-300 pl-4 italic'>
            {children}
          </blockquote>
        ),
        code: ({ children, plainText }) => (
          <pre className='my-4 rounded-md bg-gray-100 p-2'>
            <code>{children}</code>
            <p className='textred'>{plainText}</p>
          </pre>
        ),
        heading: ({ children, level }) => {
          switch (level) {
            case 1:
              return <h1 className='text-center text-fs-1'>{children}</h1>
            case 2:
              return <h2 className='text-center text-fs-2'>{children}</h2>
            case 3:
              return <h3 className='text-center text-fs-3'>{children}</h3>
            case 4:
              return <h4 className='ml-10 text-fs-4'>{children}</h4>
            case 5:
              return <h5 className='ml-10 text-fs-5'>{children}</h5>
            case 6:
              return <h6 className='ml-10 text-fs-6'>{children}</h6>
            default:
              return <h1 className='ml-10 text-fs-1'>{children}</h1>
          }
        },
        image: ({ image }) => {
          return (
            <picture>
              <img
                src={image.url}
                width={image.width}
                height={image.height}
                alt={image.alternativeText || 'blog image'}
                className='mx-auto w-1/2'
                style={{
                  width: 'auto',
                  height: 'auto',
                  objectFit: 'cover',
                }}
              />
            </picture>
          )
        },
        link: ({ children, url }) => (
          <a
            href={url}
            target='_blank'
            className='text-fs-base text-blue-500 hover:underline'
          >
            {children}
          </a>
        ),
      }}
    />
  )
}

export default BlogRendererClient
