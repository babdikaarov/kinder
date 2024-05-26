'use server'

export async function sendForm(options: { method: string; body: FormData }) {
  try {
    const response = await fetch('http://34.229.95.91:8080/api/form', options)
    if (response.ok) {
      const result = await response.json()
      console.log(result)
      return result
    } else {
      throw new Error(response.statusText)
    }
  } catch (error) {
    console.log(error)
    return error
  }
}
