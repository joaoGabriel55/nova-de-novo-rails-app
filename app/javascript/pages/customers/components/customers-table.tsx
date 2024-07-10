import React, { useState } from "react";

import { Pagination } from "@/components/pagination";
import { useCustomers } from "@/infra/hooks/customers/use-customers";
import { Button } from "@/lib/components/button";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/lib/components/table";
import {
  flexRender,
  getCoreRowModel,
  useReactTable,
} from "@tanstack/react-table";
import { columns } from "./columns";
import { RemoveCustomerDialog } from "../remove-customer-dialog";
import { useToggle } from "@/lib/hooks/use-toggle";
import { useRemoveCustomer } from "@/infra/hooks/customers/use-remove-customer";
import { Customer } from "@/domain/customer";
import { useToast } from "@/lib/hooks/use-toast";

export const CustomersTable = () => {
  const { toast } = useToast();

  const {
    customers,
    isError,
    isPending,
    page,
    goToNextPage,
    goToPreviousPage,
    refetchCustomers,
  } = useCustomers();
  const removeCustomer = useRemoveCustomer();

  const table = useReactTable({
    data: customers?.data || [],
    columns,
    getCoreRowModel: getCoreRowModel(),
  });

  const [selectedCustomer, setSelectedCustomer] = useState<Customer.Type>();
  const [removeCustomerDialogOpen, toggleRemoveCustomerDialog] = useToggle();

  const handleOpenRemoveCustomerDialog = (customer: Customer.Type) => {
    setSelectedCustomer(customer);
    toggleRemoveCustomerDialog();
  };

  const handleRemoveCustomer = async () => {
    if (!selectedCustomer) return;

    await removeCustomer.mutateAsync(selectedCustomer.id, {
      onSuccess: () => {
        toggleRemoveCustomerDialog();
        toast({
          title: `Cliente #${selectedCustomer.id} removido`,
          description: `O cliente ${selectedCustomer.name} foi removido com sucesso`,
        });
        setSelectedCustomer(undefined);
        refetchCustomers();
      },
      onError: () => {
        toast({
          title: "Falha ao remover cliente",
          description: "Ocorreu um erro ao remover o cliente",
          variant: "destructive",
        });
      },
    });
  };

  return (
    <>
      <div className="rounded-md border">
        <Table>
          <TableHeader>
            {table.getHeaderGroups().map((headerGroup) => (
              <TableRow key={headerGroup.id}>
                {headerGroup.headers.map((header) => {
                  return (
                    <TableHead key={header.id}>
                      {header.isPlaceholder
                        ? null
                        : flexRender(
                            header.column.columnDef.header,
                            header.getContext()
                          )}
                    </TableHead>
                  );
                })}
              </TableRow>
            ))}
          </TableHeader>
          <TableBody>
            {isPending ? (
              <TableRow>
                <TableCell colSpan={8} className="h-24 text-center">
                  Carregando...
                </TableCell>
              </TableRow>
            ) : isError ? (
              <TableRow>
                <TableCell colSpan={8} className="h-24 text-center">
                  Erro ao carregar clientes
                </TableCell>
              </TableRow>
            ) : table.getRowModel().rows?.length ? (
              table.getRowModel().rows.map((row) => (
                <TableRow
                  key={row.id}
                  data-state={row.getIsSelected() && "selected"}
                >
                  {row.getVisibleCells().map((cell) => (
                    <TableCell key={cell.id}>
                      {flexRender(
                        cell.column.columnDef.cell,
                        cell.getContext()
                      )}
                    </TableCell>
                  ))}
                  <TableCell>
                    <div className="flex gap-4">
                      <Button variant="outline">Editar</Button>
                      <Button
                        variant="outline"
                        className="text-red-700 hover:bg-red-700 hover:text-white"
                        onClick={() =>
                          handleOpenRemoveCustomerDialog(row.original)
                        }
                      >
                        Remover
                      </Button>
                    </div>
                  </TableCell>
                </TableRow>
              ))
            ) : (
              <TableRow>
                <TableCell colSpan={8} className="h-24 text-center">
                  Nenhum cliente encontrado
                </TableCell>
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
      {customers?.data.length ? (
        <Pagination
          page={page}
          itemsLength={customers?.data.length}
          goToNextPage={goToNextPage}
          goToPreviousPage={goToPreviousPage}
        />
      ) : null}
      <RemoveCustomerDialog
        customerInfo={{
          id: selectedCustomer?.id,
          name: selectedCustomer?.name,
        }}
        open={removeCustomerDialogOpen}
        onClose={toggleRemoveCustomerDialog}
        onConfirm={handleRemoveCustomer}
      />
    </>
  );
};
