# frozen_string_literal: true

class StateCitiesService
  def self.states
    # HttpClient.get("#{ENV['API_STATES']}/estados")
    [
      {
        "id": 11,
        "sigla": 'RN',
        "nome": 'Rondônia',
        "regiao": {
          "id": 1,
          "sigla": 'N',
          "nome": 'Norte'
        }
      }
    ].map { |state| state[:sigla] }
  end

  def self.cities(_state = 'RN')
    [
      {
        "id": 2_400_109,
        "nome": 'Natal',
        "microrregiao": {
          "id": 24_012,
          "nome": 'Seridó Oriental',
          "mesorregiao": {
            "id": 2402,
            "nome": 'Central Potiguar',
            "UF": {
              "id": 24,
              "sigla": 'RN',
              "nome": 'Rio Grande do Norte',
              "regiao": {
                "id": 2,
                "sigla": 'NE',
                "nome": 'Nordeste'
              }
            }
          }
        }
      }
    ].map { |state| state[:nome] }
  end
end
