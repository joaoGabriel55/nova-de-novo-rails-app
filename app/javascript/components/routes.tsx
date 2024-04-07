import { Customers } from "@/pages/customers";
import { AddCustomer } from "@/pages/customers/add-customer";
import { Dressmakers } from "@/pages/dressmakers";
import { ServiceOrders } from "@/pages/service-orders";
import * as React from "react";
import { createHashRouter, RouterProvider } from "react-router-dom";
import { Layout } from "./layout";
import { NoMatch } from "./no-match";

export const router = createHashRouter([
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
      },
      {
        path: "/clientes/cadastrar",
        element: <AddCustomer />,
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
  return <RouterProvider router={router} />;
};
