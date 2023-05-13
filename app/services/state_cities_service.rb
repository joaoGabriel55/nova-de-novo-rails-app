# frozen_string_literal: true

# TODO: handle errors and use stub request for test (GEM)

class StateCitiesService
  def self.states
    response = HttpClient.get("#{ENV['API_LOCALITIES']}/estados")

    return ['RN'] if response.status != 200

    JSON.parse(response.body).map { |state| state['sigla'] }.sort
  end

  def self.cities(state = 'RN')
    response = HttpClient.get("#{ENV['API_LOCALITIES']}/estados/#{state}/municipios")

    return ['Natal'] if response.status != 200

    JSON.parse(response.body).map { |city| city['nome'] }
  end
end
