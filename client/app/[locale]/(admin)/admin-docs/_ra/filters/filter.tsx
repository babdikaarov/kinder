export function filterData(searchTerm: any, data: any) {
  if (!searchTerm) return data
  searchTerm.toString()
  return data.filter(
    (item: {
      inn: any
      firstName: any
      lastName: any
      phoneNumber: any
      createdAt: any
    }) => {
      return (
        item.inn.includes(searchTerm) ||
        item.firstName.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.lastName.toLowerCase().includes(searchTerm.toLowerCase()) ||
        item.phoneNumber.includes(searchTerm) ||
        item.createdAt.includes(searchTerm)
      )
    }
  )
}
