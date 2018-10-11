# ApplicationController
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # TODO: remove this once we set up angular_devise on the frontend
  def after_sign_out_path_for(_resource_or_scope)
    platform_api_url(port: FRONTEND_PORT)
    platform_api_url(port: FRONTEND_PORT)
  end
end
