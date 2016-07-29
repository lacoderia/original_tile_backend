FactoryGirl.define do
  
  factory :tile_type, class: TileType do
    key '3x3'
    value '3x3 (7.5x7.5cm)'
    centimeters 7.5
    inches 3
    active true
  end

end
