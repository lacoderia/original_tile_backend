FactoryGirl.define do
  factory :project_tile, class: ProjectTile do

    association :tile, factory: :tile
    association :project, factory: :project
    
  end
end
