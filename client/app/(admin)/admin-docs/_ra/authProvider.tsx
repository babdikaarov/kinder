import { AuthProvider } from 'react-admin'

export const authProvider: AuthProvider = {
  login: async ({ username, password }) => {
    const request = new Request(
      `${process.env.BACKEND_URL_PUBLIC}/api/auth/signIn`,
      {
        method: 'POST',
        body: JSON.stringify({ username, password }),
        headers: new Headers({ 'Content-Type': 'application/json' }),
      }
    )
    try {
      const response = await fetch(request)
      const second_response = await fetch(
        `${process.env.CMS_API_PUBLIC}/api/logo?&populate=*`,
        { cache: 'no-cache' }
      )
        .then((res) => res.json())
        .then((data) => data.url)
        .catch(() => '')

      const avatar = second_response
      if (response.status < 200 || response.status >= 300) {
        throw new Error(response.statusText)
      }
      const auth = await response.json()

      auth.avatar = avatar
      localStorage.setItem('auth', JSON.stringify(auth))
      return Promise.resolve()
    } catch {
      throw new Error('Network error')
    }
  },
  checkError: (error) => {
    const status = error.status
    if (status === 401 || status === 403) {
      localStorage.removeItem('auth')
      return Promise.reject()
    }
    // other error code (404, 500, etc): no need to log out
    return Promise.resolve()
  },
  checkAuth: () =>
    localStorage.getItem('auth') ? Promise.resolve() : Promise.reject(),
  logout: () => {
    localStorage.removeItem('auth')
    return Promise.resolve()
  },
  getIdentity: async () => {
    const identityString = localStorage.getItem('auth')
    if (!identityString) {
      return Promise.reject(new Error('Identity not found in localStorage'))
    }

    try {
      const identity = JSON.parse(identityString)
      const { id, fullName, avatar } = identity
      return Promise.resolve({ id, fullName, avatar })
    } catch (error) {
      return Promise.reject(error)
    }
  },
  getPermissions: () => Promise.resolve(),
}

export default authProvider
