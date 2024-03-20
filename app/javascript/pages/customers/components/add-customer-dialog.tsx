import { Button } from "@/lib/components/button";
import {
  Dialog,
  DialogClose,
  DialogContent,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/lib/components/dialog";
import React from "react";
import { useNavigate } from "react-router-dom";

export const AddCustomerDialog = () => {
  const navigate = useNavigate();

  const onDismiss = () => {
    navigate(-1);
  };

  return (
    <Dialog defaultOpen>
      <DialogContent className="sm:max-w-md">
        <DialogHeader>
          <DialogTitle>Cadastrar Cliente</DialogTitle>
        </DialogHeader>
        <div className="flex items-center space-x-2">FORM</div>
        <DialogFooter className="sm:justify-start">
          <DialogClose asChild onClick={onDismiss}>
            <Button type="button" variant="secondary">
              Cancelar
            </Button>
          </DialogClose>
          <Button type="button" variant="default">
            Save
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
};
