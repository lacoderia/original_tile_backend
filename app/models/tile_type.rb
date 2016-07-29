class TileType < ApplicationRecord

  has_many :tiles

  scope :active, -> {where(active: true)}
 
end
