# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::StatesAndCities', type: :request do
  let(:states) { %w[RN SP] }
  let(:cities) { ['Natal', 'Rio Branco'] }

  before do
    allow(StateCitiesService).to receive(:states).and_return(states)
    allow(StateCitiesService).to receive(:cities).and_return(cities)
  end

  describe 'GET /states' do
    it 'returns http success' do
      get '/api/v1/states'

      expect(response).to have_http_status(:success)
    end

    it 'returns all states' do
      get '/api/v1/states'

      expect(JSON.parse(response.body)).to eq(states)
    end
  end

  describe 'GET /states/:state' do
    it 'returns http success' do
      get "/api/v1/states/#{states.first}"

      expect(response).to have_http_status(:success)
    end

    it 'returns all cities from the state' do
      get "/api/v1/states/#{states.first}"

      expect(JSON.parse(response.body)).to eq(cities)
    end
  end
end
