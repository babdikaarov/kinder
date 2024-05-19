export default async function getBlog(path: string, locale: string) {
  const url = process.env.CMS_API + path + locale
  const response = await fetch(url, { cache: 'force-cache' })
  if (!response.ok) throw Error('server is not responding')
  const { data } = await response.json()
  return data.sort(
    (
      a: { attributes: { createdAt: string | number | Date } },
      b: { attributes: { createdAt: string | number | Date } }
    ) =>
      new Date(a.attributes.createdAt).getTime() -
      new Date(b.attributes.createdAt).getTime()
  )
}
