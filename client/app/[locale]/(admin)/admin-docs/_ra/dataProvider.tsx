import { stringify } from 'query-string'
import { fetchUtils, DataProvider, Identifier } from 'ra-core'
import { filterData } from './filters/filter'
import { combine } from 'rrule/dist/esm/dateutil'

/**
 * Maps react-admin queries to a simple REST API
 *
 * This REST dialect is similar to the one of FakeRest
 *
 * @see https://github.com/marmelab/FakeRest
 *
 * @example
 *
 * getList     => GET http://my.api.url/posts?sort=['title','ASC']&range=[0, 24]
 * getOne      => GET http://my.api.url/posts/123
 * getMany     => GET http://my.api.url/posts?filter={id:[123,456,789]}
 * update      => PUT http://my.api.url/posts/123
 * create      => POST http://my.api.url/posts
 * delete      => DELETE http://my.api.url/posts/123
 *
 * @example
 *
 * import * as React from "react";
 * import { Admin, Resource } from 'react-admin';
 * import simpleRestProvider from 'ra-data-simple-rest';
 *
 * import { PostList } from './posts';
 *
 * const App = () => (
 *     <Admin dataProvider={simpleRestProvider('http://path.to.my.api/')}>
 *         <Resource name="posts" list={PostList} />
 *     </Admin>
 * );
 *
 * export default App;
 */

const dataProvider = (
  apiUrl: string,
  httpClient = fetchUtils.fetchJson,
  countHeader: string = 'Content-Range'
): DataProvider => ({
  getList: (resource, params) => {
    const { page, perPage } = params.pagination || { page: 1, perPage: 10 }
    const { field, order } = params.sort || { field: 'id', order: 'ASC' }

    const rangeStart = (page - 1) * perPage
    const rangeEnd = page * perPage

    const query = {
      sort: JSON.stringify([field, order]),
      range: JSON.stringify([rangeStart, rangeEnd]),
      filter: JSON.stringify(params.filter),
    }
    const url = `${apiUrl}/${resource}?${stringify(query)}`

    const options =
      countHeader === 'Content-Range'
        ? {
            // Chrome doesn't return `Content-Range` header if no `Range` is provided in the request.
            headers: new Headers({
              Range: `${resource}=${rangeStart}-${rangeEnd}`,
              'Access-Control-Expose-Headers': 'Content-Range',
              Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
            }),
            signal: params?.signal,
          }
        : { signal: params?.signal }

    return httpClient(url, options).then(({ headers, json }) => {
      //   if (!headers.has(countHeader)) {
      //     throw new Error(
      //       `The ${countHeader} header is missing in the HTTP Response. The simple REST data provider expects responses for lists of resources to contain this header with the total number of results to build the pagination. If you are using CORS, did you declare ${countHeader} in the Access-Control-Expose-Headers header?`
      //     )
      //   }
      // const data = filterData(params.filter.q, json).slice(rangeStart, rangeEnd)
      // const tempData = json.map((el: any) => ({ ...el, status: 'DELETED' }))
      const data = filterData(params.filter.q, json)
      const sortField = params.sort!.field

      if (params.sort?.order === 'ASC') {
        data.sort((a: any, b: any) =>
          a[sortField] < b[sortField] ? 1 : a[sortField] > b[sortField] ? -1 : 0
        )
      } else {
        data.sort((a: any, b: any) =>
          a[sortField] < b[sortField] ? -1 : a[sortField] > b[sortField] ? 1 : 0
        )
      }

      const filteredData = !params.filter.status
        ? data
        : data.filter(
            (item: { status: any }) => item.status == params.filter.status
          )

      return {
        data: filteredData.slice(rangeStart, rangeEnd),
        total: filteredData.length,
        //   countHeader === 'Content-Range'
        //     ? parseInt(headers.get('content-range')!.split('/').pop() || '', 10)
        //     : parseInt(headers.get(countHeader.toLowerCase())!),
      }
    })
  },

  getOne: async (resource, params) => {
    const url = `${apiUrl}/${resource}/${params.id}`

    const options = {
      headers: new Headers({
        Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
      }),
      signal: params?.signal,
    }
    const { json } = await httpClient(url, options)
    // json.status = 'DELETED'
    // json.status = 'ACCEPTED'
    // json.status = 'DECLINED'
    return { data: json }
  },
  getMany: (resource, params) => {
    const query = {
      filter: JSON.stringify({ id: params.ids }),
    }

    const url = `${apiUrl}/${resource}?${stringify(query)}`
    return httpClient(url, {
      signal: params?.signal,
      headers: new Headers({
        Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
      }),
    }).then(({ json }) => ({
      data: json.filter((item: { id: Identifier }) =>
        params.ids.includes(item.id)
      ),
    }))
  },

  getManyReference: (resource, params) => {
    const { page, perPage } = params.pagination
    const { field, order } = params.sort

    const rangeStart = (page - 1) * perPage
    const rangeEnd = page * perPage - 1

    const query = {
      sort: JSON.stringify([field, order]),
      range: JSON.stringify([(page - 1) * perPage, page * perPage - 1]),
      filter: JSON.stringify({
        ...params.filter,
        [params.target]: params.id,
      }),
    }
    const url = `${apiUrl}/${resource}?${stringify(query)}`
    const options =
      countHeader === 'Content-Range'
        ? {
            // Chrome doesn't return `Content-Range` header if no `Range` is provided in the request.
            headers: new Headers({
              Range: `${resource}=${rangeStart}-${rangeEnd}`,
            }),
            signal: params?.signal,
          }
        : { signal: params?.signal }

    return httpClient(url, options).then(({ headers, json }) => {
      if (!headers.has(countHeader)) {
        throw new Error(
          `The ${countHeader} header is missing in the HTTP Response. The simple REST data provider expects responses for lists of resources to contain this header with the total number of results to build the pagination. If you are using CORS, did you declare ${countHeader} in the Access-Control-Expose-Headers header?`
        )
      }
      return {
        data: json,
        total:
          countHeader === 'Content-Range'
            ? parseInt(headers.get('content-range')!.split('/').pop() || '', 10)
            : parseInt(headers.get(countHeader.toLowerCase())!),
      }
    })
  },

  update: (resource, params) => {
    const formData = new FormData()
    Object.entries(params.data).forEach(([key, value]) => {
      formData.append(key, value)
    })
    return httpClient(`${apiUrl}/${resource}/${params.previousData.inn}`, {
      method: 'PATCH',
      headers: new Headers({
        Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
      }),
      body: formData,
    })
      .then(({ json }) => {
        const url = `${apiUrl}/${resource}/${params.id}`

        const options = {
          headers: new Headers({
            Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
          }),
        }
        return httpClient(url, options)
      })
      .then(({ json }) => ({ data: json }))
  },

  // simple-rest doesn't handle provide an updateMany route, so we fallback to calling update n times instead
  updateMany: (resource, params) =>
    Promise.all(
      params.ids.map((id) =>
        httpClient(`${apiUrl}/${resource}/${id}`, {
          method: 'PUT',
          body: JSON.stringify(params.data),
        })
      )
    ).then((responses) => ({
      data: responses.map(({ json }) => json.id),
    })),

  create: (resource, params) =>
    httpClient(`${apiUrl}/${resource}`, {
      method: 'POST',
      body: JSON.stringify(params.data),
    }).then(({ json }) => ({ data: json })),

  delete: (resource, params) => {
    console.log('deleteone')

    return httpClient(`${apiUrl}/${resource}/${params.id}`, {
      method: 'DELETE',
      headers: new Headers({
        'Content-Type': 'text/plain',
        Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
      }),
    }).then(({ json }) => ({ data: json }))
  },

  // simple-rest doesn't handle filters on DELETE route, so we fallback to calling DELETE n times instead
  deleteMany: (resource, params) => {
    console.log('deletemany')
    console.log(params)

    return Promise.all(
      params.ids.map((id) =>
        httpClient(`${apiUrl}/${resource}/${id}`, {
          method: 'DELETE',
          headers: new Headers({
            'Content-Type': 'text/plain',
            Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
          }),
        })
      )
    ).then((responses) => ({
      data: responses.map(({ json }) => json),
    }))
  },
})

export default dataProvider
