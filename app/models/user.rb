class User < ApplicationRecord
   # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  #        :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  after_update :send_email_after_activation
  
  has_and_belongs_to_many :roles
  has_many :projects
  has_many :emails

  scope :inactive, -> {where(active: false)}
  scope :active, -> {where(active: true)}

  validates :email, presence: true  
  validates :name, presence: true  
  validates :country, presence: true  
  validates :state, presence: true  
  validates :city, presence: true  
  validates :location, presence: true  

  def role?(role)
    return !!self.roles.find_by_name(role)
  end

  def register internal
    user = User.find_by_email(self.email)
    if user
      self.errors.add(:registration, "Ya existe un usuario registrado con ese correo electrónico.")
      false
    elsif internal == nil or (internal.to_s != "true" and internal.to_s != "false")
      self.errors.add(:registration, "Se necesita saber si el usuario es interno o externo.")
      false
    else
      true
    end
  end

  def send_email_after_registration
    ApplicationMailer.registration_email(self).deliver_now!
    Email.create(user: self, email_status: "sent", email_type: "registration_email")
    ApplicationMailer.request_registration_email(self).deliver_now!
  end

  private

    def send_email_after_activation
      if self.active? and self.emails.where(email_type: "welcome_email").count < 1
        ApplicationMailer.welcome_email(self).deliver_now!
        Email.create(user: self, email_status: "sent", email_type: "welcome_email")
      end
    end

end
