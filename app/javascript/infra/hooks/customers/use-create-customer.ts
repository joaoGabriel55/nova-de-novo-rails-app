import { createCustomer } from "@/infra/http/customers";
import { useMutation } from "@tanstack/react-query";

export const useCreateCustomer = () => {
  return useMutation({ mutationFn: createCustomer });
};
