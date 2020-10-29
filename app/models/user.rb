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

  has_many :making_relationships,foreign_key: "maked_id", class_name: "Favorite", dependent: :destroy
  has_many :makings, through: :making_relationships
  has_many :maked_relationships,foreign_key: "making_id",class_name: "Favorite", dependent: :destroy
  has_many :makeds, through: :maked_relationships

  acts_as_followable
  acts_as_follower

  attr_accessor :current_password

  def self.search(search)
    if search != ''
      User.where(['search_number LIKE (?)', search.to_s])
    else
      User.where(search_number: nil)
    end
  end

  def create_notification_follow(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and action = ? ', current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト1'
      user.search_number = 10_000_000
    end
  end

  def self.guest_two
    find_or_create_by!(email: 'guest2@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト2'
      user.search_number = 20_000_000
    end
  end

  # お気に入り
  def making?(other_user)
    self.makings.include?(other_user)
  end

  def make(other_user)
    self.making_relationships.create(making_id: other_user.id)
  end

  def release(other_user)
    self.making_relationships.find_by(making_id: other_user.id).destroy
  end
end
