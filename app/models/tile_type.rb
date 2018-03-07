class TileType < ApplicationRecord

  has_many :tiles

    TYPES = [
    ['square', 'cuadrada'],
    ['hex', 'hexagonal']
    ]

  validates :shape, inclusion: {in: TYPES.map{ |pairs| pairs[0] } }

  scope :active, -> {where(active: true)}
 
end
