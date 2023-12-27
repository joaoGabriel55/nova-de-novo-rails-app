import { useEffect, useState } from "react";
import { useDebounce } from "./useDebounce";

const useCustomersSearch = (searchTerm = "") => {
  const debouncedSearchTerm = useDebounce(searchTerm, 500);
  const [customers, setCustomers] = useState([]);

  const searchCustomers = async ({ signal }) => {
    if (!debouncedSearchTerm) {
      setCustomers([]);
      return;
    }

    const endpoint = `/api/v1/customers?search=${debouncedSearchTerm}`;
    const result = await (await fetch(endpoint, { signal })).json();

    setCustomers(result);
  };

  useEffect(() => {
    const controller = new AbortController();

    searchCustomers({ signal: controller.signal });

    return () => {
      controller.abort();
    };
  }, [debouncedSearchTerm]);

  return {
    customers,
  };
};

export default useCustomersSearch;
