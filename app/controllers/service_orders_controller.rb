# frozen_string_literal: true

class ServiceOrdersController < ApplicationController
  def index
    # @search_count = 0
    set_service_orders
  end

  def new
    @service_order = ServiceOrder.new
  end

  private

  def search_term
    @search_term = (params[:search] if params[:search].present?)
  end

  def set_service_orders
    result = ServiceOrders::SearchPaginateServiceOrders.new(search_term:, page: params[:page]).call

    @service_orders ||= ServiceOrdersDecorator.decorate_collection(result[:data]) || []
    @service_orders_count = result[:count]
    # @search_count = result[:search_count]
  end
end
