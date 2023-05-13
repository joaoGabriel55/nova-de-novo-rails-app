# frozen_string_literal: true

class HttpClient
  def self.get(url)
    Faraday.get(url)
  end
end
