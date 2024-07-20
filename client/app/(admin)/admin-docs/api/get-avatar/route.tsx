export const dynamic = 'force-dynamic' // defaults to auto
export async function GET() {
  try {
    const response = await fetch(
      `${process.env.CMS_API}/api/logo?&populate=*`,
      { cache: 'no-cache' }
    )
    if (!response.ok) {
      throw Error(`${response.status}`)
    }
    const img = await response.json()
    // img.url = img.url.replace(`${process.env.CMS_API}`, 'localhost')
    return Response.json(img.url)
  } catch (error) {
    return Response.json('')
  }
}
