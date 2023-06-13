# frozen_string_literal: true

class StateCitiesService
  def self.states
    response = HttpConnection::Adapter.get("#{ENV['API_LOCALITIES']}/estados")

    return ['RN'] if response.status != 200

    JSON.parse(response.body).map { |state| state['sigla'] }.sort
  rescue HttpConnection::Error
    ['RN']
  end

  def self.cities(state = 'RN')
    response = HttpConnection::Adapter.get("#{ENV['API_LOCALITIES']}/estados/#{state}/municipios")

    return ['Natal'] if response.status != 200

    JSON.parse(response.body).map { |city| city['nome'] }
  rescue HttpConnection::Error
    ['Natal']
  end
end
