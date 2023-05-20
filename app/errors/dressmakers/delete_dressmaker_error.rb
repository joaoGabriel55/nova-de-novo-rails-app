# frozen_string_literal: true

module Dressmakers
  class DeleteDressmakerError < ApplicationError
    def initialize
      super(message: I18n.t('dressmakers.errors.delete'))
    end
  end
end
