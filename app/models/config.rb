class Config < ActiveRecord::Base

  DEFAULT_REQUEST_REGISTRATION_EMAIL = "sales@originalmissiontile.com"

  def self.request_registration_email
    request_registration_email = Config.find_by_key("request_registration_email")
    if request_registration_email
      return request_registration_email.value
    else
      return DEFAULT_REQUEST_REGISTRATION_EMAIL
    end
  end

end

