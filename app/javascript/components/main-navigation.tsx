import { cn } from "@/lib/utils";
import React from "react";
import { Link, useLocation } from "react-router-dom";

export const MainNavigation = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLElement>) => {
  const { pathname } = useLocation();

  return (
    <nav
      className={cn("flex items-center gap-4 lg:gap-6", className)}
      {...props}
    >
      <Link
        to="/"
        className={cn(
          "text-sm font-medium transition-colors hover:text-primary text-muted-foreground",
          pathname === "/" && "font-semibold text-primary"
        )}
      >
        Dashboard
      </Link>
      <Link
        to="/ordem-servicos"
        className={cn(
          "text-sm font-medium transition-colors hover:text-primary text-muted-foreground",
          pathname === "/ordem-servicos" && "font-semibold text-primary"
        )}
      >
        Ordem de Serviços
      </Link>
      <Link
        to="/clientes"
        className={cn(
          "text-sm font-medium transition-colors hover:text-primary text-muted-foreground",
          pathname === "/clientes" && "font-semibold text-primary"
        )}
      >
        Clientes
      </Link>
      <Link
        to="/costureiras"
        className={cn(
          "text-sm font-medium transition-colors hover:text-primary text-muted-foreground",
          pathname === "/costureiras" && "font-semibold text-primary"
        )}
      >
        Costureiras
      </Link>
    </nav>
  );
};
