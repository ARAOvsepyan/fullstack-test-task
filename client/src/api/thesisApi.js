import { $host } from './index'

export const createThesis = async (info) => {
  const { data } = await $host.post('api/thesis', info)
  return data
}

export const updateThesis = async (info) => {
  const { data } = await $host.patch('api/thesis/' + info.id, { title: info.title })
  return data
}

export const deleteThesis = async (id) => {
  const { data } = await $host.delete('api/thesis/' + id)
  return data
}
