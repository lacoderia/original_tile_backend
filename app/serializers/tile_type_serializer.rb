class TileTypeSerializer < ActiveModel::Serializer
  attributes :key, :value, :centimeters, :inches
end
