class Entry < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  belongs_to :applicant, class_name: 'User', foreign_key: 'applicant_id', optional: true
end
