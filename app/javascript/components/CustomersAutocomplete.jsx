import React, { Fragment, useState } from "react";
import useCustomersSearch from "../hooks/useCustomersSearch";
import { Combobox } from "@headlessui/react";

export const CustomersAutocomplete = () => {
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedCustomer, setSelectedCustomer] = useState(null);
  const { customers } = useCustomersSearch(searchTerm);

  const handleChangeSearchTerm = (value) => {
    setSearchTerm(value);
    setSelectedCustomer(null);
  };

  return (
    <Fragment>
      <input
        name="service_order[customer]"
        value={selectedCustomer?.id}
        required
        hidden
        readOnly
      />
      <Combobox
        as="div"
        className="relative w-full"
        value={selectedCustomer?.name}
        onChange={setSelectedCustomer}
      >
        <Combobox.Input
          className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
          placeholder="Digite o nome do cliente..."
          onChange={(event) => handleChangeSearchTerm(event.target.value)}
        />
        <Combobox.Options className="z-10 w-full absolute py-2 text-sm text-gray-700 dark:text-gray-200 bg-white divide-y divide-gray-100 rounded-lg shadow dark:bg-gray-700">
          {customers.map((customer) => (
            <Combobox.Option
              className="inline-flex w-full px-4 py-2 dark:text-white hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white cursor-pointer"
              key={customer.id}
              value={customer}
            >
              {customer.name}
            </Combobox.Option>
          ))}
          {customers.length === 0 && (
            <Combobox.Option className="inline-flex w-full px-4 py-2 dark:text-white hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white cursor-pointer">
              Cliente não encontrado
            </Combobox.Option>
          )}
        </Combobox.Options>
      </Combobox>
    </Fragment>
  );
};
