import type { Config } from 'tailwindcss'
import colors, { blue } from 'tailwindcss/colors'
import form from '@tailwindcss/forms'
const config: Config = {
  important: true,
  // purge: ['./src/**/*.{js,ts,jsx,tsx}'],
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './_1_pages/**/*.{js,ts,jsx,tsx,mdx}',
    './_2_widgets/**/*.{js,ts,jsx,tsx,mdx}',
    './_3_features/**/*.{js,ts,jsx,tsx,mdx}',
    './_4_entities/**/*.{js,ts,jsx,tsx,mdx}',
    './_5_shared/**/*.{js,ts,jsx,tsx,mdx}',
    './_6_lib/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      rotate: {
        false: '0deg',
        true: '180deg',
      },
      transitionProperty: {
        'grid-rows': 'grid-template-rows',
      },
      keyframes: {
        slideInTop: {
          '0%': { transform: 'translateY(-100%)', opacity: '0' },
          '100%': { transform: 'translateY(0)', opacity: '1' },
        },
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
      },
      animation: {
        'spin-slow': 'spin 3s linear infinite',
        fadeIn: 'fadeIn 0.5s ease-in-out',
        slideInTop: 'slideInTop 0.5s ease-in-out',
      },
      fontSize: {
        'fs-sm': 'var(--fs-sm)',
        'fs-base': 'var(--fs-base)',
        'fs-lg': 'var(--fs-lg)',
        'fs-6': 'var(--fs-6)',
        'fs-5': 'var(--fs-5)',
        'fs-4': 'var(--fs-4)',
        'fs-3': 'var(--fs-3)',
        'fs-2': 'var(--fs-2)',
        'fs-1': 'var(--fs-1)',
      },
      fontFamily: {
        poppins: ['var(--font-poppins)'],
      },
      maxWidth: {
        wrapperLimit: '1216px',
      },
      minWidth: {
        DialogLimit: '900px',
      },
      borderRadius: {
        '30': '30px',
        '20': '20px',
        '16': '16px',
        '10': '10px',
      },
      gridTemplateColumns: {
        '2auto': 'repeat(2, minmax(0, auto))',
        formCol: '400px 240px',
        formRow: '200px minmax(900px, 1fr) 100px',
      },
      colors: {
        blue: {
          500: '#605DEC',
        },
        dark: {
          800: '#1E1E1E',
          600: '#353535',
          700: '#292929',
          300: '#5B5B5B',
          200: '#696969',
          100: '#CACACA',
        },
        biege: {
          400: '#FFFAEE',
          600: '#FFF2DB',
        },
        light: {
          800: '#E3E3E3',
        },
        theme: {
          bg: '#F9F9F9',
        },
      },
    },
    screens: {
      xl: { max: '1279px' },
      // xl: '1280px',
      // desctop
      lgExtra: { max: '1140px' },
      lg: { max: '1023px' },
      // laptop
      mdExtra: { max: '850px' },
      md: { max: '768px' },
      // tablet
      // tablet
      smExtra: { max: '640px' },
      sm500: { max: '500px' },
      sm: { max: '430px' },
      xsm: { max: '390px' },
      // mobile
    },
  },
  plugins: [form],
}
export default config
