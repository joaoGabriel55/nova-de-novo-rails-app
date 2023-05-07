# frozen_string_literal: true

class Address < ApplicationRecord
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :neighborhood, presence: true
  validates :number, presence: true
  validates :complement, length: { maximum: 255 }

  belongs_to :customer
end
