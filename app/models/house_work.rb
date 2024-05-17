class HouseWork < ApplicationRecord
  belongs_to :user

  validates :work_name, presence: true
  validates :time, presence: true

  def self.total_time(current_user)
    where(user_id: current_user.id).sum(:time)
  end

  def self.total_money(current_user)
    total_time(current_user) * ( 850 / 60 )
  end
end
