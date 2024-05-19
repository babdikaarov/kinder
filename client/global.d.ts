type Messages = typeof import('./app/_locale/ru.json')
declare interface IntlMessages extends Messages {}

declare namespace myTS {
  type I = {
    i: string
  }
  type L = 'ky' | 'ru'
}
