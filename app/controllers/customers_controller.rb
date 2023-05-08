# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customers, only: %i[index]

  def index
    @search_count = 0

    set_customers
  end

  def new
    @customer = Customer.new
    @customer.build_address

    @states = StateCitiesService.states || []
    @cities = StateCitiesService.cities || []
  end

  # TODO: show/edit

  def create
    @customer = Customer.new(customer_params)

    Customers::CreateCustomer.new(customer: @customer).call

    redirect_to customers_path
  rescue Customers::CreateCustomerError
    render :new
  end

  private

  def customer_params
    params.require(:customer).permit(
      :id, :name, :email, :phone_number, :whatsapp,
      address_attributes: %i[
        street city state zip_code number complement
      ]
    )
  end

  def search_term
    @search_term = (params[:search] if params[:search].present?)
  end

  def set_customers
    result = Customers::SearchPaginateCustomers.new(search_term:, page: params[:page]).call

    @customers ||= result[:data] || []
    @customers_count = result[:count]
    @search_count = result[:search_count]
  end
end
