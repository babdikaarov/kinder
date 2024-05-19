export default async function getData(
  path: string,
  options: RequestInit = { cache: 'no-cache' }
) {
  const url = process.env.CMS_API + path
  const response = await fetch(url, options)
  if (!response.ok) throw Error('server is not responding')
  const data = await response.json()
  return data
}
