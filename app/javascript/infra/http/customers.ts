import { Customer } from "@/domain/customer";
import axios from "axios";

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
  const response = await axios.get("/api/v1/customers", {
    params: { search, page: String(page) },
  });

  const customers = response.data;

  return customers as Response;
};
