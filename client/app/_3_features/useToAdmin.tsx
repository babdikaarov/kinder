import { useRouter } from 'next/navigation'
import { useState, useEffect, useRef } from 'react'

interface AdminConfig {
  [key: string]: {
    secretKey: string
    url: string
  }
}

const useToAdmin = (config: AdminConfig) => {
  const [keySequence, setKeySequence] = useState<string[]>([])
  const [enterMode, setEnterMode] = useState<boolean>(false)
  const [activeSecret, setActiveSecret] = useState<string | null>(null)
  const router = useRouter()
  const alertRef = useRef<{ enter: boolean; exit: boolean }>({
    enter: false,
    exit: false,
  })

  useEffect(() => {
    const handleKeydown = (event: KeyboardEvent) => {
      const key = event.key

      if (!enterMode) {
        setKeySequence((prev) => {
          const newSequence = [...prev, key].slice(-2)
          if (newSequence.join('') === '>>') {
            setEnterMode(true)
            if (!alertRef.current.enter) {
              alert('Enter')
              alertRef.current.enter = true
            }
            alertRef.current.exit = false
            return []
          }
          return newSequence
        })
      } else {
        setKeySequence((prevSequence) => {
          const newSequence = [...prevSequence, key]
          if (newSequence.join('').slice(-2) === '>>') {
            setEnterMode(false)
            if (!alertRef.current.exit) {
              alert('Exit!!!!!!!!')
              alertRef.current.exit = true
            }
            alertRef.current.enter = false
            return []
          }

          for (const [key, { secretKey, url }] of Object.entries(config)) {
            if (newSequence.join('').endsWith(secretKey)) {
              setActiveSecret(key)
              router.push(url)
              return []
            }
          }

          return newSequence.slice(
            -Math.max(
              ...Object.values(config).map(({ secretKey }) => secretKey.length)
            )
          )
        })
      }
    }

    window.addEventListener('keydown', handleKeydown)

    // Cleanup event listener on component unmount
    return () => {
      window.removeEventListener('keydown', handleKeydown)
    }
  }, [config, enterMode, router])

  return { keySequence: keySequence.join(''), enterMode, activeSecret }
}

export default useToAdmin

// import { useRouter } from 'next/navigation'
// import { useState, useEffect, useRef } from 'react'

// const useToAdmin = (secretWord: string, path: string) => {
//   const [keySequence, setKeySequence] = useState<string[]>([])
//   const [enterMode, setEnterMode] = useState<boolean>(false)
//   const router = useRouter()
//   const alertRef = useRef<{ enter: boolean; exit: boolean }>({
//     enter: false,
//     exit: false,
//   })

//   useEffect(() => {
//     const handleKeydown = (event: KeyboardEvent) => {
//       const key = event.key

//       if (!enterMode) {
//         setKeySequence((prev) => {
//           const newSequence = [...prev, key].slice(-2)
//           if (newSequence.join('') === '>>') {
//             setEnterMode(true)
//             if (!alertRef.current.enter) {
//               alert('Entered admin mode')
//               alertRef.current.enter = true
//             }
//             alertRef.current.exit = false
//             return []
//           }
//           return newSequence
//         })
//       } else {
//         setKeySequence((prevSequence) => {
//           const newSequence = [...prevSequence, key].slice(-secretWord.length)
//           if (newSequence.join('') === secretWord) {
//             router.push(path)
//             return []
//           }
//           if (newSequence.join('').slice(-2) === '<<') {
//             setEnterMode(false)
//             if (!alertRef.current.exit) {
//               alert('Exit enter mode')
//               alertRef.current.exit = true
//             }
//             alertRef.current.enter = false
//             return []
//           }
//           return newSequence
//         })
//       }
//     }

//     window.addEventListener('keydown', handleKeydown)

//     // Cleanup event listener on component unmount
//     return () => {
//       window.removeEventListener('keydown', handleKeydown)
//     }
//   }, [secretWord, path, enterMode, router])

//   return { keySequence: keySequence.join(''), enterMode }
// }

// export default useToAdmin
