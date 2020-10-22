class Schedule < ApplicationRecord
  belongs_to :user, optional: true

  validates :location, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :from_time_sun, :to_time_sun, :from_time_mon, :to_time_mon, :from_time_tue, :to_time_tue, :from_time_wed, :to_time_wed, :from_time_thu, :to_time_thu, :from_time_fri, :to_time_fri, :from_time_sat, :to_time_sat,
            numericality: { only_integer: true, greater_than: 0, less_than: 25 }, allow_blank: true

end
