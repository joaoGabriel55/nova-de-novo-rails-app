import { api } from "./api";

export const getNationStates = async () => {
  const response = await api.get("/api/v1/states");

  const states = await response.data;

  return states as Array<string>;
};

export const getNationStateCities = async ({ state }: { state: string }) => {
  const response = await api.get(`/api/v1/states/${state}`);

  const states = await response.data;

  return states as Array<string>;
};
