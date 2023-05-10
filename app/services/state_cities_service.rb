# frozen_string_literal: true

class StateCitiesService
  def self.states
    response = HttpClient.get("#{ENV['API_LOCALITIES']}/estados")
    JSON.parse(response.body).map { |state| state['sigla'] }.sort
  end

  def self.cities(state = 'RN')
    response = HttpClient.get("#{ENV['API_LOCALITIES']}/estados/#{state}/municipios")
    JSON.parse(response.body).map { |city| city['nome'] }
  end
end
