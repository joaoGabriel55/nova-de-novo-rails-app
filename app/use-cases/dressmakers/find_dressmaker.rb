# frozen_string_literal: true

module Dressmakers
  class FindDressmaker
    def initialize(id:)
      @dressmaker_id = id
    end

    def call
      Dressmaker.find(dressmaker_id)
    rescue ActiveRecord::RecordNotFound
      raise DressmakerErrors::NotFoundError
    end

    private

    attr_accessor :dressmaker_id
  end
end
