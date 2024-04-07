import React from "react";

import { Button } from "@/lib/components/button";
import { Link } from "react-router-dom";
import { CustomersTable } from "./components/customers-table";
import { SearchCustomers } from "./components/search-customers";

export const Customers = () => {
  return (
    <>
      <div className="flex w-full gap-4 justify-between">
        <SearchCustomers />
        <Link to="/clientes/cadastrar">
          <Button variant="default">Cadastrar</Button>
        </Link>
      </div>
      <CustomersTable />
    </>
  );
};
