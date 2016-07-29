FactoryGirl.define do
  
  factory :tile, class: Tile do
    url 'url_test'
    active true
    name 'test 3x3'
    image nil
    association :tile_type, factory: :tile_type
  end

end
