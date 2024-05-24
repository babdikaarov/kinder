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
  return <p>Width: {screenSize.width}px</p>
}

export default ScreenSizeDisplay
