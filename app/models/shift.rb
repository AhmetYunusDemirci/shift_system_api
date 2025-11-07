class Shift < ApplicationRecord
  belongs_to :employee
  validates :start_time, :end_time, presence: true
end
