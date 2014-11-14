class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def not_authorized
    redirect_to root_path, alert: "You are not authorized to access that functionality."
  end

  %w(Lecturer Student).each do |k| 
    define_method "current_#{k.underscore}" do 
      current_user if current_user.is_a?(k.constantize)
    end 

    define_method "authenticate_#{k.underscore}!" do 
      |opts={}| send("current_#{k.underscore}") || not_authorized 
    end 
  end

  protected

  def configure_devise_permitted_parameters
    registration_params = [:first_name, :last_name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
    }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
  
end
