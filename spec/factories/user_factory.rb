FactoryGirl.define do
  
  factory :user, class: User do
    sequence(:email){ |n| "user-#{n}@originalmissiontile.com" }
    first_name 'Test'
    last_name 'User'
    password '12345678'
    password_confirmation '12345678'
    active true
    country "Mexico"
    city "CDMX"
    state "CDMX"
    roles {[FactoryGirl.create(:internal_role)]}
  end

end
