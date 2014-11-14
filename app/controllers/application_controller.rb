class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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
end
