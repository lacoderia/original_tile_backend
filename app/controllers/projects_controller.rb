class ProjectsController < ApiController
  
  before_action :authenticate_user!
    
  def by_user
    begin
      projects = Project.by_user_id(current_user.id)
      render json: projects
    rescue Exception => e
      project = Project.new
      project.errors.add(:error_getting_projects, e.message)
      render json: ErrorSerializer.serialize(project.errors), status: 500
    end
  end

  def save
    begin
      project = Project.create!(url: params[:url], name: params[:name], user: current_user)
      render json: project
    rescue Exception => e
      project = Project.new
      project.errors.add(:error_getting_projects, e.message)
      render json: ErrorSerializer.serialize(project.errors), status: 500
    end
  end

  def destroy
    begin
      projects_left = Project.delete_for_user(params[:id], current_user)
      render json: projects_left
    rescue Exception => e
      project = Project.new
      project.errors.add(:error_deleting_project, e.message)
      render json: ErrorSerializer.serialize(project.errors), status: 500
    end
  end
  
end
