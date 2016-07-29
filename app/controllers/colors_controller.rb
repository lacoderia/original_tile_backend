class ColorsController < ApiController 

  before_action :authenticate_user!
    
  def index
    begin
      colors = Color.active
      render json: colors
    rescue Exception => e
      color = Color.new
      color.errors.add(:error_getting_colors, e.message)
      render json: ErrorSerializer.serialize(color.errors), status: 500
    end
  end

end
