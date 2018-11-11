class RegistrationsController < Devise::RegistrationsController
  include ErrorSerializer

  authorize_resource :class => false

  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :active, :reference, :location, :country, :city, :state, :address, :zip, :phone])
  end

  def create
    build_resource(sign_up_params)
    @user = resource
    can_be_saved = @user.register params[:internal]
    if can_be_saved and @user.save
      if params[:internal].to_s == "true"
        @user.update_attribute(:roles, [Role.internal])
      elsif params[:internal].to_s == "false"
        @user.update_attribute(:roles, [Role.external])
      end
      @user.send_email_after_registration
      success @user
    else
      @user.errors.add(:incorrect_registration, "No se pudo crear el usuario.")
      error @user
    end
  end
  
  def success user
    render json: user
  end

  def error user
    render json: ErrorSerializer.serialize(user.errors), status: 500
  end

end
