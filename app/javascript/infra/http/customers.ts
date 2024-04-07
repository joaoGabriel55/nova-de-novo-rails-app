import { Customer } from "@/domain/customer";
import axios from "axios";
import { api } from "./api";

type Params = {
  page?: number;
  search?: string;
};

type Response = {
  count: number;
  search_count?: number;
  data: Array<Customer.Type>;
};

export const getCustomers = async ({ page = 1, search = "" }: Params) => {
  const response = await api.get("/api/v1/customers", {
    params: { search, page: String(page) },
  });

  const customers = response.data;

  return customers as Response;
};

export const createCustomer = async (customer: Customer.CreateType) => {
  const { address, ...rest } = customer;

  const response = await api.post("/api/v1/customers", {
    ...rest,
    phone_number: customer.phoneNumber,
    address_attributes: {
      ...address,
      zip_code: address.zipCode,
    },
  });

  const createdCustomer = response.data;

  return createdCustomer as Customer.Type;
};
