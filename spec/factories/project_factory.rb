FactoryGirl.define do
  factory :project, class: Project do

    url 'PDF_file'
    name 'test project name'
    filename 'file.pdf'
    association :user, factory: :user
    after(:create) do |project|
      create_list(:project_tile, 3, project: project)
    end

  end
end
