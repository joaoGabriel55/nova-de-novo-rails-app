import React from "react";

import {
  PaginationContent,
  PaginationItem,
  PaginationLink,
  PaginationNext,
  PaginationPrevious,
  Pagination as PaginationRoot,
} from "@/lib/components/pagination";

const ITEMS_PER_PAGE = 10;

type Props = {
  page: number;
  itemsLength: number;
  goToNextPage: () => void;
  goToPreviousPage: () => void;
};

export const Pagination = ({
  page,
  itemsLength,
  goToNextPage,
  goToPreviousPage,
}: Props) => {
  return (
    <div className="flex items-center justify-end space-x-2 py-4">
      <PaginationRoot>
        <PaginationContent>
          {page > 1 && (
            <PaginationItem>
              <PaginationPrevious onClick={() => goToPreviousPage()} />
            </PaginationItem>
          )}
          <PaginationItem>
            <PaginationLink>{page}</PaginationLink>
          </PaginationItem>
          {itemsLength > ITEMS_PER_PAGE && (
            <PaginationItem>
              <PaginationNext onClick={() => goToNextPage()} />
            </PaginationItem>
          )}
        </PaginationContent>
      </PaginationRoot>
    </div>
  );
};
