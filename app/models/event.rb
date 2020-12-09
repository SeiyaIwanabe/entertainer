class Event < ApplicationRecord
  belongs_to :user

  validates :event_name, presence: true
  validates :event_name, length: { maximum: 20 }
  validates :reward, presence: true
  validates :datetime, presence: true
  validates :place, presence: true
  validates :place, length: { maximum: 30 }
  validates :detail, presence: true
end
