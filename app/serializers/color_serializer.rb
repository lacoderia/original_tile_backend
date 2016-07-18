class ColorSerializer < ActiveModel::Serializer
  attributes :id, :name, :hex_value, :active
end
