class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Your application controller will need to know what to do
  # if a CanCan exception is thrown
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, notice: exception.message
  end

  # ActiveModel::ForbiddenAttributesError CanCan Workaround
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << []
    devise_parameter_sanitizer.for(:account_update) << []
  end
end
