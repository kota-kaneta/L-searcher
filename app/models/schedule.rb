class Schedule < ApplicationRecord
  default_scope -> { order(updated_at: :desc) }
  belongs_to :user, optional: true

  validates :location, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :from_time_sun, :to_time_sun, :from_time_mon, :to_time_mon, :from_time_tue, :to_time_tue, :from_time_wed, :to_time_wed, :from_time_thu, :to_time_thu, :from_time_fri, :to_time_fri, :from_time_sat, :to_time_sat,
            numericality: { only_integer: true, less_than: 25 }, allow_blank: true
end
