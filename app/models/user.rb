class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :icon, IconUploader

  validates :nickname, presence: true
  validates :nickname, length: { maximum: 10 }
  # validates :genre, presence: true
  validates :genre, length: { maximum: 10 }
  validates :introduction, length: { maximum: 140 }

  has_many :events
  has_many :entries
  has_many :favorites, dependent: :destroy

  has_many :recruiting_events, class_name: 'Event', foreign_key: 'recruiter_id'
  has_many :applicant_events, class_name: 'Event', foreign_key: 'applicant_id'

  def self.guest
    find_or_create_by!(nickname: "ゲストユーザー", email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  def already_favorited?(event)
    self.favorites.exists?(event_id :event.id)
  end
end
