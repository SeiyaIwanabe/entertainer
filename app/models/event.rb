class Event < ApplicationRecord
  belongs_to :user, optional: true

  belongs_to :recruiter, class_name: 'User', foreign_key: 'recruiter_id', optional: true
  belongs_to :applicant, class_name: 'User', foreign_key: 'applicant_id', optional: true

  validates :event_name, presence: true
  validates :event_name, length: { maximum: 20 }
  validates :reward, presence: true
  validates :datetime, presence: true
  validates :place, presence: true
  validates :place, length: { maximum: 30 }
  validates :detail, presence: true
end
