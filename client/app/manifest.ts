import { MetadataRoute } from 'next'

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: 'Кашкалдак - Дошкольное образовательное учреждение им. Азима Нарматова',
    short_name: 'Кашкалдак',
    description:
      'Дошкольное образовательное учреждение Кашкалдак им. Азима Нарматова - местонахождение Ноокатский район, государственное детское воспитательное учреждение. Веб сайт для ознакомления и отправики запрошенных документов для родителей воспитанников',
    start_url: '/',
    display: 'standalone',
    background_color: '#fff',
    theme_color: '#fff',
    icons: [
      {
        src: '/icon-manifest.png',
        sizes: '512x512',
        type: 'image/png',
      },
    ],
  }
}
