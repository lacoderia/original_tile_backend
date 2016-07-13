class ProjectsController < ApiController
  include ErrorSerializer
  
  before_action :authenticate_user!
    
  def by_user_id 
    begin
      projects = Project.by_user_id(params[:user_id])
      render json: projects
    rescue Exception => e
      project = Project.new
      project.errors.add(:error_getting_projects, e.message)
      render json: ErrorSerializer.serialize(project.errors), status: 500
    end
  end
  
end
