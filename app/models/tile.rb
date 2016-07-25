class Tile < ApplicationRecord

  has_attached_file :image, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  TYPES = [
    [ '3x3', '3x3" (7.5x7.5cm)', 7.5, 3],
    [ '4x4', '4x4" (10x10cm)', 10, 4],
    [ '6x6', '6x6" (15x15cm)', 15, 6],
    [ '8x8', '8x8" (20x20cm)', 20, 8],
    [ '10x10', '10x10" (25x25cm)', 25, 10],
    [ '12x12', '12x12" (30x30cm)', 30, 12]
  ]

  validates :tile_type, inclusion: {in: TYPES.map{ |pairs| pairs[0] } }
  
  scope :active, -> {where(active: true)}
  scope :by_tile_type, ->(tile_type) {where(tile_type: tile_type)}

  def self.tile_types
    hash_tile_types = {}
    TYPES.each do |tile_type|
      hash_tile_types[tile_type[0]] = [tile_type[1], tile_type[2], tile_type[3]]
    end
    return hash_tile_types 
  end

end
