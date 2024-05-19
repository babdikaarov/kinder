export default async function galleryInfo(path: string, locale: string) {
  const url = process.env.CMS_API + path + locale
  const response = await fetch(url)
  if (!response.ok) throw Error('server is not responding')
  const { data } = await response.json()
  return data
}
