# frozen_string_literal: true

module Dressmakers
  class CreateDressmaker
    def initialize(dressmaker:)
      @dressmaker = dressmaker
    end

    def call
      dressmaker.save!
    rescue ActiveRecord::RecordInvalid
      raise Dressmakers::CreateDressmakerError
    end

    private

    attr_accessor :dressmaker
  end
end
