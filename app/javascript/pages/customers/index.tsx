import React from "react";

import { Layout } from "@/components/layout";
import { Button } from "@/lib/components/button";
import {
  Dialog,
  DialogClose,
  DialogContent,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/lib/components/dialog";
import { Input } from "@/lib/components/input";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/lib/components/table";
import { Link, Outlet } from "react-router-dom";

export const Customers = () => {
  return (
    <>
      <div className="flex gap-4 w-full items-center mb-6">
        <Input type="text" placeholder="Email" />
        <Link to="/clientes/cadastrar">
          <Button variant="default">Cadastrar</Button>
        </Link>
      </div>
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead className="w-[100px]">ID</TableHead>
            <TableHead>Nome</TableHead>
            <TableHead>Telefone</TableHead>
            <TableHead>WhatsApp</TableHead>
            <TableHead>Email</TableHead>
            <TableHead>Criado em</TableHead>
            <TableHead>Atualizado em</TableHead>
            <TableHead></TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          <TableRow>
            <TableCell className="font-medium">123</TableCell>
            <TableCell>John Doe</TableCell>
            <TableCell>84 99999-9999</TableCell>
            <TableCell>84 99999-9999</TableCell>
            <TableCell>4Nt5W@example.com</TableCell>
            <TableCell>21/12/2022</TableCell>
            <TableCell>21/12/2022</TableCell>
            <TableCell className="flex justify-end gap-4">
              <Dialog>
                <DialogTrigger>
                  <Button variant="outline">Editar</Button>
                </DialogTrigger>
                <DialogContent className="sm:max-w-md">
                  <DialogHeader>
                    <DialogTitle>Share link</DialogTitle>
                  </DialogHeader>
                  <div className="flex items-center space-x-2"></div>
                  <DialogFooter className="sm:justify-start">
                    <DialogClose asChild>
                      <Button type="button" variant="secondary">
                        Close
                      </Button>
                    </DialogClose>
                  </DialogFooter>
                </DialogContent>
              </Dialog>
              <Button
                variant="outline"
                className="text-red-700 hover:bg-red-700 hover:text-white"
              >
                Remover
              </Button>
            </TableCell>
          </TableRow>
        </TableBody>
      </Table>
      <Outlet />
    </>
  );
};
