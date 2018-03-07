class TileTypeSerializer < ActiveModel::Serializer
  attributes :key, :value, :centimeters, :inches, :shape
end
