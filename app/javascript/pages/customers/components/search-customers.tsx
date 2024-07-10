import React, { useState } from "react";

import { Button } from "@/lib/components/button";
import { Input } from "@/lib/components/input";
import { Search } from "lucide-react";
import { useSearchParams } from "react-router-dom";

export const SearchCustomers = () => {
  const [params, setParams] = useSearchParams();

  const [search, setSearch] = useState(params.get("search") || "");

  const onSearch = () => {
    setParams({ search: search, page: "1" });
  };

  return (
    <div className="flex gap-4 w-1/2 items-center mb-6">
      <Input
        type="text"
        placeholder="Buscar cliente..."
        name="search"
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        onKeyDown={(e) => {
          if (e.key === "Enter") {
            onSearch();
          }
        }}
      />
      <Button variant="default" aria-label="buscar-cliente" onClick={onSearch}>
        <Search className="h-4 w-4" />
      </Button>
    </div>
  );
};
