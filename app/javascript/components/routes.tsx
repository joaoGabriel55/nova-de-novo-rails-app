import { Customers } from "@/pages/customers";
import { AddCustomerDialog } from "@/pages/customers/components/add-customer-dialog";
import { Dressmakers } from "@/pages/dressmakers";
import { ServiceOrders } from "@/pages/service-orders";
import * as React from "react";
import { createHashRouter, RouterProvider } from "react-router-dom";
import { Layout } from "./layout";
import { NoMatch } from "./no-match";

export const routes = createHashRouter([
  {
    element: <Layout />,
    children: [
      {
        path: "/",
        element: <>Dashboard</>,
      },
      {
        path: "ordem-servicos",
        element: <ServiceOrders />,
      },
      {
        path: "clientes",
        element: <Customers />,
        children: [
          {
            path: "cadastrar",
            element: <AddCustomerDialog />,
          },
        ],
      },
      {
        path: "/costureiras",
        element: <Dressmakers />,
      },
    ],
  },
  {
    path: "*",
    element: <NoMatch />,
  },
]);

export const AppRoutes = () => {
  return <RouterProvider router={routes} />;
};
