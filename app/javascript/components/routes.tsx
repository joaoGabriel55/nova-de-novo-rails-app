import * as React from "react";
import { Customers } from "@/pages/customers";
import { Dressmakers } from "@/pages/dressmakers";
import { ServiceOrders } from "@/pages/service-orders";

export const routes = [
  {
    path: "/ordem-servicos",
    element: <ServiceOrders />,
  },
  {
    path: "/clientes",
    element: <Customers />,
  },
  {
    path: "/costureiras",
    element: <Dressmakers />,
  },
];
