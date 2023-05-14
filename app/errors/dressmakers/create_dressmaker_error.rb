# frozen_string_literal: true

module Dressmakers
  class CreateDressmakerError < ApplicationError
    def initialize
      super(message: I18n.t('dressmakers.errors.create'))
    end
  end
end
