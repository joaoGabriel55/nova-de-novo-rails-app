# frozen_string_literal: true

class Api::V1::CustomersController < ApplicationController
  before_action :load_states_and_cities, only: %i[new create edit show]
  before_action :load_customer, only: %i[show update]

  def index
    search_term = params[:search] if params[:search].present?

    result = Customers::SearchPaginateCustomers.new(search_term:, page: params[:page]).call

    render json: result
  end

  def create
    @customer = Customer.new(customer_params)

    Customers::CreateCustomer.new(customer: @customer).call

    render json: @customer
  rescue CustomerErrors::CreateError
    render json: { error: I18n.t('customers.errors.create') }, status: :unprocessable_entity
  end

  def update
    Customers::UpdateCustomer.new(customer: @customer, attributes: customer_params).call

    flash[:notice] = I18n.t('customers.success.update')
    redirect_to customer_path(@customer)
  rescue CustomerErrors::UpdateError => e
    flash[:error] = e.message
    render :show
  end

  def destroy
    Customers::DeleteCustomer.new(id: params[:id]).call

    flash[:notice] = I18n.t('customers.success.destroy')

    render json: {}, status: :no_content
  rescue CustomerErrors::DeleteError
    render json: { error: I18n.t('customers.errors.delete') }, status: :unprocessable_entity
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

  def load_states_and_cities
    @states ||= StateCitiesService.states || []
    @cities ||= StateCitiesService.cities || []
  end

  def load_customer
    @customer ||= Customers::FindCustomer.new(id: params[:id]).call
  end
end
