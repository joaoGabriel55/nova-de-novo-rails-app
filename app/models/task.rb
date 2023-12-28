# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  belongs_to :service_order
end
