# frozen_string_literal: true

module Dressmakers
  class UpdateDressmakerError < ApplicationError
    def initialize
      super(message: I18n.t('dressmakers.errors.update'))
    end
  end
end
