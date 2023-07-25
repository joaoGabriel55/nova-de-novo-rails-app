# frozen_string_literal: true

class ServiceOrder < ApplicationRecord
  enum :status_service, { pending: 0, finished: 1, canceled: 2 }
  enum :delivery_period, { morning: 0, afternoon: 1 }

  validates :delivery_period, presence: true
  validates :status_service, presence: true
  validates :entry_date, presence: true,
                         comparison: { less_than_or_equal_to: :delivery_date }
  validates :delivery_date, presence: true, comparison: { greater_than_or_equal_to: :entry_date }

  belongs_to :customer
  belongs_to :dressmaker
  has_many :tasks

  scope :activated, -> { where(deleted_at: nil) }
end
