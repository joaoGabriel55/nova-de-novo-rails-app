import React from "react";
import { render, screen } from "@/tests/test-utils";
import { Customers } from ".";
import { useCustomers } from "../../infra/hooks/customers/use-customers";
import { Customer } from "@/domain/customer";

vi.mock("./hooks/useCustomers");

describe("Customers Page", () => {
  const setup = ({
    data = [] as Array<Customer.Type>,
    isPending = false,
    isError = false,
  } = {}) => {
    vi.mocked(useCustomers).mockReturnValue({
      customers: {
        count: data.length,
        data,
        searchCount: 0,
      },
      isPending,
      isError,
      goToNextPage: () => {},
      goToPreviousPage: () => {},
      page: 1,
    });

    render(<Customers />);
  };

  it("renders page", () => {
    setup({
      data: [
        {
          id: 1,
          name: "John",
          email: "j@j.com",
          createdAt: "2022-01-01",
          updatedAt: "2022-01-01",
          phoneNumber: "",
          whatsapp: "333-333-3333",
          address: {
            street: "Rua",
            number: "1",
            complement: "",
            neighborhood: "Floriano",
            city: "Natal",
            state: "RN",
            zipCode: "300000-000",
          },
        },
      ],
    });

    expect(screen.getByText("Cadastrar")).toBeTruthy();
    expect(screen.getByText("John")).toBeTruthy();
    expect(screen.getByText("j@j.com")).toBeTruthy();
  });

  describe("when does not have customers", () => {
    it("renders no customers", () => {
      setup();

      expect(screen.getByText("Nenhum cliente encontrado")).toBeTruthy();
    });
  });

  describe("when is loading customers", () => {
    it("renders loading message", () => {
      setup({ isPending: true });

      expect(screen.getByText("Carregando...")).toBeTruthy();
    });
  });

  describe("when there is an error", () => {
    it("renders error message", () => {
      setup({ isError: true });

      expect(screen.getByText("Erro ao carregar clientes")).toBeTruthy();
    });
  });
});
