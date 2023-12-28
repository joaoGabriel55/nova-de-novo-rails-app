# frozen_string_literal: true

class Api::V1::StatesAndCitiesController < ApplicationController
  def states
    states = Rails.cache.fetch('states', expires_in: 12.hours) do
      StateCitiesService.states.to_json
    end

    render json: states
  end

  def state_cities
    cities = Rails.cache.fetch("cities_#{params[:state]}", expires_in: 12.hours) do
      StateCitiesService.cities(params[:state]).to_json
    end

    render json: cities
  end
end
