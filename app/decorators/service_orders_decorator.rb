# frozen_string_literal: true

class ServiceOrdersDecorator < ApplicationDecorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def total
    (tasks.sum(&:price) / 1000.0).ceil(2)
  end
end
