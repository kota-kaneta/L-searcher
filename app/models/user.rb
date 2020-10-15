class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :search_number, presence: true
  validates :search_number, uniqueness: true, format: { with: /\A\d{8}\z/ }

  has_many :schedules
  has_one_attached :image
end