class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles

  def role?(role)
    return !!self.roles.find_by_name(role)
  end
  
end
