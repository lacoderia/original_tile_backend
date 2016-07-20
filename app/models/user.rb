class User < ApplicationRecord
   # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  #        :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  
  has_and_belongs_to_many :roles
  has_many :projects

  scope :inactive, -> {where(active: false)}
  scope :active, -> {where(active: true)}

  validates :email, presence: true  
  validates :first_name, presence: true  
  validates :last_name, presence: true  
  validates :country, presence: true  
  validates :state, presence: true  
  validates :city, presence: true  

  def role?(role)
    return !!self.roles.find_by_name(role)
  end

  def register internal
    user = User.find_by_email(self.email)
    if user
      self.errors.add(:registration, "Ya existe un usuario registrado con ese correo electrónico.")
      false
    elsif not internal or (internal.to_s != "true" and internal.to_s != "false")
      self.errors.add(:registration, "Se necesita saber si el usuario es interno o externo.")
      false
    else
      true
    end
  end
end
