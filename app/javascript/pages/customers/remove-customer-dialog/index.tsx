import { Customer } from "@/domain/customer";
import { Button } from "@/lib/components/button";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/lib/components/dialog";
import React from "react";
import { useNavigate } from "react-router-dom";

type Props = {
  customerInfo: Partial<Pick<Customer.Type, "id" | "name">>;
  open: boolean;
  onClose: () => void;
  onConfirm: () => void;
};

export const RemoveCustomerDialog = ({
  customerInfo,
  open,
  onClose,
  onConfirm,
}: Props) => {
  return (
    <Dialog open={open} onOpenChange={onClose}>
      <DialogContent className="sm:max-w-[425px]">
        <DialogHeader>
          <DialogTitle>Excluir cliente #{customerInfo.id}</DialogTitle>
          <DialogDescription className="py-4">
            <p>
              Tem certeza que deseja excluir{" "}
              <strong>{customerInfo.name}</strong>?
            </p>
            <p>
              Esta operação <strong>não</strong> poderá ser desfeita.
            </p>
          </DialogDescription>
        </DialogHeader>
        <DialogFooter>
          <Button variant="secondary" onClick={onClose}>
            Não
          </Button>
          <Button type="submit" onClick={onConfirm}>
            Sim
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
};
