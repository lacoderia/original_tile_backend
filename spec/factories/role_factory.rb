FactoryGirl.define do
  factory :internal_role, class: Role do
    name 'internal_user'
  end

  factory :external_role, class: Role do
    name 'external_user'
  end
  
end

