FactoryGirl.define do
  
  factory :tile, class: Tile do
    url 'url_test'
    tile_type '3x3'
    active true
    name 'test 3x3'
  end

end
