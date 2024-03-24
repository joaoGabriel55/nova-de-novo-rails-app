import { getCustomers } from "@/infra/http/customers";
import { useQuery } from "@tanstack/react-query";
import { useSearchParams } from "react-router-dom";

export const useCustomers = () => {
  const [params, setParams] = useSearchParams();

  const page = Number(params.get("page")) || 1;
  const search = params.get("search") || "";

  const {
    data: customers,
    isError,
    isPending,
  } = useQuery({
    queryKey: [`customers/${params}/${search}`, page, search],
    queryFn: () => getCustomers({ page, search }),
  });

  const goToNextPage = () => {
    setParams({ search, page: String(page + 1) });
  };

  const goToPreviousPage = () => {
    if (page === 1) return;

    setParams({ search, page: String(page - 1) });
  };

  return {
    customers: {
      count: customers?.count || 0,
      data: customers?.data || [],
      searchCount: customers?.search_count || 0,
    },
    isError,
    isPending,
    page,
    goToNextPage,
    goToPreviousPage,
  };
};
