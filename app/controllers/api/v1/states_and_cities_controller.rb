# frozen_string_literal: true

class Api::V1::StatesAndCitiesController < ApplicationController
  def states
    render json: StateCitiesService.states
  end

  def state_cities
    render json: StateCitiesService.cities(params[:state])
  end
end
