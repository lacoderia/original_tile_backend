class Tile < ApplicationRecord

  TYPES = [
    [ '3x3', '3x3"(7.5x7.5cm)'],
    [ '4x4', '4x4"(10x10cm)'],
    [ '6x6', '6x6"(15x15cm)'],
    [ '8x8', '8x8"(20x20cm)'],
    [ '10x10', '10x10"(25x25cm)'],
    [ '12x12', '12x12"(30x30cm)']
  ]

  validates :tile_type, inclusion: {in: TYPES.map{ |pairs| pairs[0] } }
  
  scope :active, -> {where(active: true)}
  scope :by_tile_type, ->(tile_type) {where(tile_type: tile_type)}

  def self.tile_types
    hash_tile_types = {}
    TYPES.each do |tile_type|
      hash_tile_types[tile_type[0]] = tile_type[1]
    end
    return hash_tile_types 
  end

end
