# frozen_string_literal: true

module Customers
  PER_PAGE = 10

  class PaginateCustomers
    def initialize(page:, per_page: PER_PAGE)
      @page = page
      @per_page = per_page
    end

    def call
      customers_sorted_by_date = Customer.paginate(page:, per_page:).order(created_at: :desc)

      { count: Customer.count, data: customers_sorted_by_date }
    end

    private

    attr_reader :page, :per_page
  end
end
