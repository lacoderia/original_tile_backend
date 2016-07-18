class Color < ApplicationRecord
  
  scope :active, -> {where(active: true)}
  
end
