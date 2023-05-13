# frozen_string_literal: true

module Customers
  PER_PAGE = 10

  class SearchPaginateCustomers
    def initialize(page:, search_term: nil, per_page: PER_PAGE)
      @search_term = search_term
      @page = page
      @per_page = per_page
      customers_active
    end

    def call
      total_customers = customers.count

      if search_term.present?
        searched_customers = customers.search_by_name(search_term)
        {
          search_count: searched_customers.size,
          count: total_customers,
          data: searched_customers.paginate(page:, per_page:).order(created_at: :desc)
        }
      else
        {
          count: total_customers,
          data: customers.paginate(page:, per_page:).order(created_at: :desc)
        }
      end
    end

    private

    attr_reader :search_term, :page, :per_page, :customers

    def customers_active
      @customers ||= Customer.activated
    end
  end
end
