# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :load_states_and_cities, only: %i[new create edit show]
  before_action :load_customer, only: %i[show update]

  def index
    @search_count = 0

    set_customers
  end

  def new
    @customer = Customer.new
    @customer.build_address
  end

  def show; end

  def create
    @customer = Customer.new(customer_params)

    Customers::CreateCustomer.new(customer: @customer).call

    flash[:notice] = I18n.t('customers.success.create')
    redirect_to customers_path
  rescue Customers::CreateCustomerError
    render :new
  end

  def update
    Customers::UpdateCustomer.new(customer: @customer, attributes: customer_params).call

    flash[:notice] = I18n.t('customers.success.update')
    redirect_to customer_path(@customer)
  rescue Customers::UpdateCustomerError => e
    flash[:error] = e.message
    render :show
  end

  def destroy
    Customers::DeleteCustomer.new(id: params[:id]).call

    flash[:notice] = I18n.t('customers.success.destroy')

    redirect_to customers_path
  rescue Customers::DeleteCustomerError => e
    flash[:error] = e.message
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(
      :id, :name, :email, :phone_number, :whatsapp,
      address_attributes: %i[
        street city state zip_code neighborhood number complement
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

  def load_states_and_cities
    @states ||= StateCitiesService.states || []
    @cities ||= StateCitiesService.cities || []
  end

  def load_customer
    @customer ||= Customers::FindCustomer.new(id: params[:id]).call
  end
end
