# frozen_string_literal: true

module ServiceOrders
  PER_PAGE = 10

  class SearchPaginateServiceOrders
    def initialize(page:, search_term: nil, per_page: PER_PAGE)
      @search_term = search_term
      @page = page
      @per_page = per_page
      service_orders_active
    end

    def call
      total_orders = service_orders.count

      {
        count: total_orders,
        data: service_orders.paginate(page:, per_page:)
      }
    end

    private

    attr_reader :search_term, :page, :per_page, :service_orders

    def service_orders_active
      @service_orders ||= ServiceOrder.activated.order(created_at: :desc)
    end
  end
end
