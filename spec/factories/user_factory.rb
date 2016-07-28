FactoryGirl.define do
  
  factory :user, class: User do
    sequence(:email){ |n| "user-#{n}@originalmissiontile.com" }
    name 'Test User'
    password '12345678'
    password_confirmation '12345678'
    active true
    country "Mexico"
    city "CDMX"
    state "CDMX"
    roles {[FactoryGirl.create(:internal_role)]}
  end

end
