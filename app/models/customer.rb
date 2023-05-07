# frozen_string_literal: true

class Customer < ApplicationRecord
  include PgSearch::Model

  validates :name, presence: true
  validates :phone_number, presence: true

  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }
end
