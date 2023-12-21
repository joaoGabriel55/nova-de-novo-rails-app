# frozen_string_literal: true

module Dressmakers
  class ListDressmakers
    def initialize(activated: true)
      if activated
        dressmakers_active
      else
        dressmakers_fired
      end
    end

    def call
      { dressmakers:, count: @dressmakers.count }
    end

    private

    attr_reader :dressmakers

    def dressmakers_not_deleted
      Dressmaker.where(deleted_at: nil).order(created_at: :desc)
    end

    def dressmakers_active
      @dressmakers ||= dressmakers_not_deleted.activated
    end

    def dressmakers_fired
      @dressmakers ||= dressmakers_not_deleted.fired
    end
  end
end
