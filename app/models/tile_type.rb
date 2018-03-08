class TileType < ApplicationRecord

  has_many :tiles

  TYPES = [
    ['square', 'cuadrada'],
    ['hex', 'hexagonal']
  ]

  INCHES = [
    12.0,
    10.0,
    8.0,
    6.0,
    4.0,
    3.0
  ]

  validates :shape, inclusion: {in: TYPES.map{ |pairs| pairs[0] } }
  validates :inches, inclusion: {in: INCHES}

  scope :active, -> {where(active: true)}
 
end
