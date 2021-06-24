class Project < ApplicationRecord
  belongs_to :user
  has_many :project_tiles, dependent: :destroy
  has_many :tiles, through: :project_tiles
  
  scope :by_user_id, -> (id) {where(user_id: id)}

  def self.delete_for_user project_id, current_user
    projects = current_user.projects.where("id = ?", project_id)
    if projects.empty?
      raise "El projecto no pertenece a ese usuario."
    else
      projects[0].destroy
      return current_user.projects
    end    
  end

  def send_by_email user, email 
    ApplicationMailer.budget_email(user, email, self).deliver_now!    
  end

end
