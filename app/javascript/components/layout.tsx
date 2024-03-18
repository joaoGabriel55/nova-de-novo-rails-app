import React from "react";
import { MainNavigation } from "./main-navigation";
import { Avatar, AvatarFallback, AvatarImage } from "@/lib/components/avatar";

type Props = {
  title: string;
  children: React.ReactNode;
};

export const Layout = ({ title, children }: Props) => {
  return (
    <main className="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8 relative">
      <h1 className="text-xl font-bold px-4 tracking-tight">NOVA DE NOVO</h1>
      <div className="flex h-16 items-center px-4 justify-between">
        <MainNavigation />
        <Avatar className="h-8 w-8">
          <AvatarImage src="/avatars/01.png" alt="@shadcn" />
          <AvatarFallback>FQ</AvatarFallback>
        </Avatar>
      </div>
      <div className="flex-1 p-8 pt-6">
        <div className="flex items-center justify-between my-2">
          <h2 className="text-3xl font-bold tracking-tight">{title}</h2>
        </div>
        {children}
      </div>
    </main>
  );
};
