# frozen_string_literal: true

module Dressmakers
  class ListDressmakers
    def initialize(activated:)
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

    def dressmakers_active
      @dressmakers ||= Dressmaker.activated.order(created_at: :desc)
    end

    def dressmakers_fired
      @dressmakers ||= Dressmaker.fired.order(created_at: :desc)
    end
  end
end
