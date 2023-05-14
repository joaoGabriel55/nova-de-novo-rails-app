# frozen_string_literal: true

class Dressmaker < ApplicationRecord
  validates :name, presence: true
  validates :max_service_quantity, presence: true, numericality: { only_integer: true }
  validates :start_working_date, presence: true
  validates :end_working_date, comparison: { greater_than: :start_working_date }, if: -> { end_working_date.present? }
end
