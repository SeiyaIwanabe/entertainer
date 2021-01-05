class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #画像投稿
  mount_uploader :icon, IconUploader

  validates :nickname, presence: true
  #パスワードは半角英数字のみで８文字以上
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  validates :password, presence: true,
                       length: { minimum: 8 },
                       format: { with: VALID_PASSWORD_REGEX }

  validates :nickname, length: { maximum: 10 }
  validates :nickname, length: { minimum: 2  }
  validates :genre, length: { maximum: 20 }
  validates :introduction, length: { maximum: 140 }

  has_many :events, dependent: :destroy

  has_many :entries, dependent: :destroy
  has_many :entry_events, through: :entries, source: :event
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_events, through: :favorites, source: :event

  has_many :recruiting_events, class_name: 'Event', foreign_key: 'recruiter_id'
  has_many :applicant_events, class_name: 'Event', foreign_key: 'applicant_id'

  has_many :comments, dependent: :destroy

  #ゲストログイン機能のインスタンスメソッド
  def self.guest
    find_or_create_by!(nickname: "ゲストユーザー", email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
