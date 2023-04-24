class Customer < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :start_working_date, presence: true
  validate :start_date_before_end_date # FIX

  private

  def start_date_before_end_date
    end_date = Date.parse(end_working_date) rescue nil

    if start_working_date && end_date && start_working_date > end_date
      errors.add(:end_working_date, "must be after start date")
    end
  end
end
