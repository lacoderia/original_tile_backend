FactoryGirl.define do
  factory :project, class: Project do

    url 'PDF_file'
    name 'test project name'
    filename 'file.pdf'
    association :user, factory: :user

  end
end
