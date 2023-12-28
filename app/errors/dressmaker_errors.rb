# frozen_string_literal: true

module DressmakerErrors
  class CreateError < ApplicationError
    def initialize
      super(message: I18n.t('dressmakers.errors.create'))
    end
  end

  class UpdateError < ApplicationError
    def initialize
      super(message: I18n.t('dressmakers.errors.update'))
    end
  end

  class NotFoundError < ApplicationError
    def initialize
      super(message: I18n.t('dressmakers.errors.not_found'))
    end
  end

  class DeleteError < ApplicationError
    def initialize
      super(message: I18n.t('dressmakers.errors.delete'))
    end
  end
end
