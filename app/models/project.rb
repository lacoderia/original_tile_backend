class Project < ApplicationRecord
  belongs_to :user
  scope :by_user_id, -> (id) {where(user_id: id)}
end
