class Entry < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  validates_uniqueness_of :event_id, scope: :user_id
end
