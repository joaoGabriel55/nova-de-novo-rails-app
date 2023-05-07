# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customers, only: %i[index create]

  def index
    set_customers
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    Customers::CreateCustomer.new(customer: @customer).call

    render :index
  rescue Customers::CreateCustomerError
    render :new
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone_number, :whatsapp)
  end

  def set_customers
    result = Customers::PaginateCustomers.new(page: params[:page]).call

    @customers ||= result[:data] || []
    @customers_count = result[:count]
  end
end
