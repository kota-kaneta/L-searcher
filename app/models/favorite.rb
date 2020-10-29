class Favorite < ApplicationRecord
  default_scope -> { order(created_at: 'DESC') }

  belongs_to :maked, class_name: "User"
  belongs_to :making, class_name: "User"

  validates :maked_id, presence: true
  validates :making_id, presence: true
end
