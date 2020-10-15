class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :w_day
  belongs_to_active_hash :from_time
  belongs_to_active_hash :to_time
  belongs_to :user

  validates :w_day_id, :from_time_id, :to_time_id, presence: true
  validates :w_day_id, :from_time_id, :to_time_id, numericality: { other_than: 1 }
end
