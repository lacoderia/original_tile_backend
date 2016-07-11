FactoryGirl.define do
  factory :project, class: Project do

    url 'PDF_file'
    name 'test project name'
    association :user, factory: :user

  end
end

