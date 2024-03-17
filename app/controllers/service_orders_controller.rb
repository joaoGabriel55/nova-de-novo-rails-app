# frozen_string_literal: true

class ServiceOrdersController < ApplicationController
  before_action :load_dressmakers, only: %i[new create]

  def index
    set_service_orders
  end

  def new
    @service_order = ServiceOrder.new
  end

  def create
    @service_order = ServiceOrder.new(service_order_params)

    ServiceOrders::CreateServiceOrder.new(service_order: @service_order).call

    flash[:notice] = I18n.t('service_orders.success.create')
    redirect_to service_orders_path
  rescue ServiceOrderErrors::CreateError => e
    flash[:error] = e.message
    render :new
  rescue ServiceOrderErrors::ExceededMaxNumberOfDressmakerError => e
    flash[:error] = e.message
    render :new
  rescue ServiceOrderErrors::EmptyTasksError => e
    flash[:error] = e.message
    render :new
  end

  private

  def search_term
    @search_term = (params[:search] if params[:search].present?)
  end

  def set_service_orders
    result = ServiceOrders::SearchPaginateServiceOrders.new(search_term:, page: params[:page]).call

    @service_orders ||= ServiceOrdersDecorator.decorate_collection(result[:data]) || []
    @service_orders_count = result[:count]
  end

  def load_dressmakers
    @dressmakers, = Dressmakers::ListDressmakers.new.call.values_at(:dressmakers)
  end

  def service_order_params
    params.require(:service_order).permit(:id, :delivery_date, :entry_date, :delivery_period, :status_service, :paid,
                                          :customer_id, :dressmaker_id)
  end
end
