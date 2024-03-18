import { cn } from "@/lib/utils";
import React from "react";
import { Link, useLocation } from "react-router-dom";

export const MainNavigation = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLElement>) => {
  const { pathname } = useLocation();
  console.log(pathname);

  return (
    // <nav className="bg-white border-gray-200 dark:bg-gray-900">
    //   <div className="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
    //     <div className="flex gap-4">
    //       <a href="/" className="flex items-center">
    //         <span className="self-center text-2xl font-semibold whitespace-nowrap text-primary-600 dark:text-white">
    //           Nova de Novo
    //         </span>
    //       </a>
    //       <button
    //         id="theme-toggle"
    //         type="button"
    //         className="border-2 border-gray-100 dark:border-gray-500 rounded-full p-2 text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700"
    //       >
    //         <div id="theme-toggle-dark-icon" className="flex hidden">
    //           <span className="material-symbols-outlined">dark_mode</span>
    //         </div>
    //         <div id="theme-toggle-light-icon" className="flex hidden">
    //           <span className="material-symbols-outlined">light_mode</span>
    //         </div>
    //       </button>
    //     </div>
    //     <button
    //       data-collapse-toggle="navbar-default"
    //       type="button"
    //       className="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
    //       aria-controls="navbar-default"
    //       aria-expanded="false"
    //     >
    //       <span className="sr-only">Open main menu</span>
    //       <svg
    //         className="w-6 h-6"
    //         aria-hidden="true"
    //         fill="currentColor"
    //         viewBox="0 0 20 20"
    //         xmlns="http://www.w3.org/2000/svg"
    //       >
    //         <path
    //           fill-rule="evenodd"
    //           d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
    //           clip-rule="evenodd"
    //         ></path>
    //       </svg>
    //     </button>
    //     <div className="hidden w-full md:block md:w-auto" id="navbar-default">
    //       <ul className="font-medium flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
    //         <li>
    //           <a className="">test</a>
    //         </li>
    //       </ul>
    //     </div>
    //   </div>
    // </nav>
    <nav
      className={cn("flex items-center gap-4 lg:gap-6", className)}
      {...props}
    >
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
