class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :search_number, presence: true
  validates :search_number, uniqueness: true, format: { with: /\A\d{8}\z/ }
  validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

  has_one :schedule
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  acts_as_followable
  acts_as_follower

  def self.search(search)
    if search != ''
      User.where(['search_number LIKE (?)', search.to_s])
    else
      User.where(search_number: nil)
    end
  end
end
