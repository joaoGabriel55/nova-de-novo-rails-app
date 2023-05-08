# frozen_string_literal: true

class HttpClient
  def self.get(url)
    Faraday.get(url)
  end

  private

  attr_reader :connection
end
