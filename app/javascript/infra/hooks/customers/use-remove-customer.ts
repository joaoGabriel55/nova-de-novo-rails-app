import { removeCustomer } from "@/infra/http/customers";
import { useMutation } from "@tanstack/react-query";

export const useRemoveCustomer = () => {
  return useMutation({ mutationFn: removeCustomer });
};
