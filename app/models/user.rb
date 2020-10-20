class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :search_number, presence: true
  validates :search_number, uniqueness: true, format: { with: /\A\d{8}\z/ }

  has_one :schedule
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  acts_as_followable
  acts_as_follower

  def self.search(search)   
    if search != ""
      User.where(['search_number LIKE (?)', "#{search}"])
    else
      User.where(search_number: nil)
    end  
  end
end
