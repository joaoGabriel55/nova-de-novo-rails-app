# frozen_string_literal: true

module Customers
  class PaginateCustomers
    def initialize(page:, per_page: 10)
      @page = page
      @per_page = per_page
    end

    def call
      Customer.paginate(page:, per_page:)
    end

    private

    attr_reader :page, :per_page
  end
end
