class Role < ApplicationRecord
  has_and_belongs_to_many :users

  def self.internal
    internal_role = Role.find_by_name("internal_user")
    if internal_role
      return internal_role 
    else
      return Role.create(name: 'internal_user')
    end
  end

  def self.external
    external_role = Role.find_by_name("external_user")
    if external_role
      return external_role 
    else
      return Role.create(name: 'external_user')
    end
  end
  
end
