class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  validates :name, :search_number, presence: true
  validates :search_number, uniqueness: true, format: { with: /\A\d{8}\z/ }
  validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

  has_one :schedule
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :sns_credentials

  acts_as_followable
  acts_as_follower

  def self.search(search)
    if search != ''
      User.where(['search_number LIKE (?)', search.to_s])
    else
      User.where(search_number: nil)
    end
  end

  def create_notification_follow(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  def self.from_omniauth(auth)
    binding.pry
  end
end
