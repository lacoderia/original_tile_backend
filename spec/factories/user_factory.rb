FactoryGirl.define do
  
  factory :user, class: User do
    sequence(:email){ |n| "user-#{n}@originalmissiontile.com" }
    name 'Test User'
    password '12345678'
    password_confirmation '12345678'
    active true
    country "Mexico"
    location "MX"
    city "CDMX"
    state "CDMX"
    address "Caracas Norte 324"
    phone "55864192"
    zip "07708"
    roles {[FactoryGirl.create(:internal_role)]}
  end

end
