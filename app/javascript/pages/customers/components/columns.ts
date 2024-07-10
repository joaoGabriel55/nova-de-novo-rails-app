import { Customer } from "@/domain/customer";
import { ColumnDef } from "@tanstack/react-table";

export const columns: ColumnDef<Customer.Type>[] = [
  {
    accessorKey: "id",
    header: "ID",
  },
  {
    accessorKey: "name",
    header: "Nome",
  },
  {
    accessorKey: "email",
    header: "Email",
  },
  {
    accessorKey: "phone",
    header: "Telefone",
  },
  {
    accessorKey: "whatsapp",
    header: "WhatsApp",
  },
  {
    accessorKey: "createdAt",
    header: "Criado em",
  },
  {
    accessorKey: "updatedAt",
    header: "Atualizado em",
  },
];
