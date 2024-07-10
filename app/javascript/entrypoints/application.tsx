import { AppRoutes } from "@/components/routes";
import { queryClient } from "@/infra/query-client";
import { Toaster } from "@/lib/components/toaster";
import { QueryClientProvider } from "@tanstack/react-query";
import React from "react";
import ReactDOM from "react-dom/client";

const root = ReactDOM.createRoot(
  document.getElementById("root") as HTMLElement
);

root.render(
  <QueryClientProvider client={queryClient}>
    <AppRoutes />
    <Toaster />
  </QueryClientProvider>
);
