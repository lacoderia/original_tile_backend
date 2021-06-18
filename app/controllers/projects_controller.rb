class ProjectsController < ApiController
  
  before_action :authenticate_user!

  def send_by_email
    begin
      project = Project.find_by_id(params[:project_id]) 
      project.send_by_email(current_user, params[:email])
      render json: project
    rescue Exception => e
      project = Project.new
      project.errors.add(:error_sending_project_by_email, e.message)
      render json: ErrorSerializer.serialize(project.errors), status: 500
    end
  end
    
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
      if params[:tile_ids]
        tiles = params[:tile_ids].map do |tile_id|
          Tile.find(tile_id)
        end
      end
      project = Project.create!(url: params[:url], name: params[:name], user: current_user, filename: params[:filename])
      project.tiles = tiles if tiles
      render json: project
    rescue Exception => e
      project = Project.new
      project.errors.add(:error_saving_projects, e.message)
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
