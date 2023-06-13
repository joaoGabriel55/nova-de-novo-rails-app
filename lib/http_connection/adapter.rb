# frozen_string_literal: true

module HttpConnection
  class Error < StandardError; end

  class Adapter
    def self.get(url)
      Faraday.get(url)
    rescue Faraday::Error => e
      raise Error, e
    end
  end
end
