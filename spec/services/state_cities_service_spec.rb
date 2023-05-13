# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StateCitiesService', type: :service do
  describe '.states' do
    it 'returns an array of state codes' do
      allow(HttpClient).to receive(:get).and_return(double(status: 200, body: '[{"sigla": "RN"}]'))

      expect(StateCitiesService.states).to eq(['RN'])
    end

    it 'returns default state code if API response is not successful' do
      allow(HttpClient).to receive(:get).and_return(double(status: 500))

      expect(StateCitiesService.states).to eq(['RN'])
    end
  end

  describe '.cities' do
    it 'returns an array of city names for the given state code' do
      allow(HttpClient).to receive(:get).and_return(double(status: 200, body: '[{"nome": "Natal"}]'))

      expect(StateCitiesService.cities('RN')).to eq(['Natal'])
    end

    it 'returns default city name if API response is not successful' do
      allow(HttpClient).to receive(:get).and_return(double(status: 500))

      expect(StateCitiesService.cities('RN')).to eq(['Natal'])
    end

    it 'returns an empty array if the state code is not provided' do
      allow(HttpClient).to receive(:get).and_return(double(status: 200, body: '[]'))

      expect(StateCitiesService.cities).to eq([])
    end
  end
end
