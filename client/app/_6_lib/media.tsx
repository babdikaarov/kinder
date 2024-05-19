'use client'
import React, { useState, useEffect } from 'react'

const ScreenSizeDisplay = () => {
  const [screenSize, setScreenSize] = useState({
    width: 0,
    height: 0,
  })

  const updateScreenSize = () => {
    setScreenSize({
      width: window.innerWidth,
      height: window.innerHeight,
    })
  }

  useEffect(() => {
    updateScreenSize()
    window.addEventListener('resize', updateScreenSize)
    return () => {
      window.removeEventListener('resize', updateScreenSize)
    }
  }, [])
  return (
    <p className='fixed left-0 top-20 bg-green-500 lg:top-16'>
      Screen Width: {screenSize.width}px, Height: {screenSize.height}px
    </p>
  )
}

export default ScreenSizeDisplay
