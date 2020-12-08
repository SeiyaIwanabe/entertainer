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

  def self.guest
    find_or_create_by!(nickname: "ゲストユーザー", email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
