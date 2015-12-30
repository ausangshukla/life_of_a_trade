class ApplicationController < ActionController::Base
  
  include DeviseTokenAuth::Concerns::SetUserByToken
  
  respond_to :json
    
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
      render status: 403, template: "/layouts/access_denied.json"
  end
end
