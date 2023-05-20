# frozen_string_literal: true

module Dressmakers
  class DeleteDressmaker
    def initialize(id:)
      @dressmaker_id = id
    end

    def call
      dressmaker = Dressmaker.find(dressmaker_id)
      dressmaker.update(deleted_at: Time.now)
    rescue StandardError
      raise Dressmakers::DeleteDressmakerError
    end

    private

    attr_accessor :dressmaker_id
  end
end
