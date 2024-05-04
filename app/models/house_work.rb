class HouseWork < ApplicationRecord
  belongs_to :user

  validates :work_name, presence: true
  validates :time, presence: true
end
