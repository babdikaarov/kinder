import { colors } from './colors'

interface ColorTheme {
  main: string
  container: string
  onContainer: string
}
export interface CalendarsConfig {
  [key: string]: {
    colorName: string
    lightColors: ColorTheme
    darkColors: ColorTheme
  }
}
export function generateEventColorTheme(category: string[]) {
  let calendarsConfig: CalendarsConfig = {}
  category.forEach((el, index) => {
    calendarsConfig[el] = {
      colorName: el.split(' ').join('_'),
      lightColors: {
        main: colors[index].main,
        container: colors[index].container,
        onContainer: colors[index].onContainer,
      },
      darkColors: {
        main: colors[index].main,
        container: colors[index].container,
        onContainer: colors[index].onContainer,
      },
    }
  })
  return calendarsConfig
}
