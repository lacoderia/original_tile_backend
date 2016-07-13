class RegistrationsController < Devise::RegistrationsController
  include ErrorSerializer

  authorize_resource :class => false

  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :active)}
  end

  def create
    build_resource(sign_up_params)
    @user = resource
    saved = @user.register
    if saved
      @user.save
      #SendEmailJob.perform_later("welcome", @user, nil)
      #new_auth_header = @user.create_new_auth_token
      #response.headers.merge!(new_auth_header)
      #sign_in @user
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
