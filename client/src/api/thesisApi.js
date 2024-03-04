import { $host } from "./index";

export const createThesis = async (info) => {
  const {data} = await $host.post('api/thesis', info);
  return data;
};

export const updateThesis = async (info) => {
  const {data} = await $host.patch('api/thesis/' + info.id, info.title);
  return data;
};