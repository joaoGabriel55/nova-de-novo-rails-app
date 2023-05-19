# frozen_string_literal: true

module Dressmakers
  class ListDressmakers
    def initialize
      @dressmakers = Dressmaker.all.order(created_at: :desc)
    end

    def call
      { dressmakers: @dressmakers, count: @dressmakers.count }
    end

    private

    attr_reader :dressmakers
  end
end
