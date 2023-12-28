# frozen_string_literal: true

class TaskType < ApplicationRecord
  validates :name, presence: true
end
