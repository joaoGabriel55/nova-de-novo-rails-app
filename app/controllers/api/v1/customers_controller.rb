# frozen_string_literal: true

class Api::V1::CustomersController < ApplicationController
  def search
    search_term = params[:search] if params[:search].present?

    result = Customers::SearchPaginateCustomers.new(search_term:).call

    render json: result[:data] || []
  end
end
