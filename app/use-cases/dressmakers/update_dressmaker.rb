# frozen_string_literal: true

module Dressmakers
  class UpdateDressmaker
    def initialize(dressmaker:, attributes:)
      @dressmaker = dressmaker
      @attributes = attributes
    end

    def call
      dressmaker.update!(attributes)
    rescue ActiveRecord::RecordInvalid
      raise Dressmakers::UpdateDressmakerError
    end

    private

    attr_accessor :dressmaker, :attributes
  end
end
