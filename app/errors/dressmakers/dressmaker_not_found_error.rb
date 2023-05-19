# frozen_string_literal: true

module Dressmakers
  class DressmakerNotFoundError < ApplicationError
    def initialize
      super(message: I18n.t('dressmakers.errors.not_found'))
    end
  end
end
