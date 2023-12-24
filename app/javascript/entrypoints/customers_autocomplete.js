import React, { useState } from "react";
import useCustomersSearch from "./hooks/useCustomersSearch";
import render from "./react_render";

function CustomersAutocomplete() {
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedCustomer, setSelectedCustomer] = useState(null);
  const [showOptions, setShowOptions] = useState(false);

  const { customers } = useCustomersSearch(searchTerm);

  const handleShowCustomersOptions = () => {
    if (searchTerm) setShowOptions(true);
  };

  const handleSelectedCustomer = (customer) => {
    setSelectedCustomer(customer);
    setSearchTerm(customer.name);
    setShowOptions(false);
  };

  const handleChangeSearchTerm = (value) => {
    setSearchTerm(value);
    setShowOptions(true);
    setSelectedCustomer(null);
  };

  return (
    <>
      <input
        name="service_order[customer]"
        value={selectedCustomer?.id}
        required
        hidden
        readOnly
      />
      <div className="relative w-full">
        <input
          type="search"
          id="search-dropdown"
          className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
          placeholder="Digite o nome do cliente..."
          value={searchTerm}
          role="combobox"
          aria-autocomplete="both"
          aria-expanded={showOptions}
          aria-controls="cb1-listbox"
          tabindex="-1"
          onChange={(e) => handleChangeSearchTerm(e.target.value)}
          onFocus={() => handleShowCustomersOptions()}
        />
        {showOptions && (
          <ul
            id="cb1-listbox"
            className="z-10 absolute py-2 text-sm text-gray-700 dark:text-gray-200 bg-white divide-y divide-gray-100 rounded-lg shadow w-full dark:bg-gray-700"
            aria-labelledby="dropdown-button"
            role="listbox"
          >
            {customers.map((customer) => (
              <li
                key={customer.id}
                className="inline-flex w-full px-4 py-2 text-white hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white cursor-pointer"
                role="option"
                onClick={() => {
                  handleSelectedCustomer(customer);
                }}
              >
                {customer.name}
              </li>
            ))}
            {customers.length === 0 && (
              <li className="inline-flex w-full px-4 py-2 text-white hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white cursor-pointer">
                Cliente não encontrado
              </li>
            )}
          </ul>
        )}
      </div>
    </>
  );
}

render("autocomplete", <CustomersAutocomplete />);
