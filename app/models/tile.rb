class Tile < ApplicationRecord

  has_attached_file :image, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
 
  belongs_to :tile_type
  has_many :project_tiles
  has_many :projects, through: :project_tiles
  
  scope :active, -> {where(active: true)}
  scope :by_tile_type, ->(tile_type) {joins(:tile_type).where("tile_types.key = ?", tile_type)}

  def self.tile_types
    hash_tile_types = {}
    TYPES.each do |tile_type|
      hash_tile_types[tile_type[0]] = [tile_type[1], tile_type[2], tile_type[3]]
    end
    return hash_tile_types 
  end

end
