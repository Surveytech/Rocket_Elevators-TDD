require 'pg'
class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true, with: :exception  
    skip_before_action :verify_authenticity_token

    helper_method :current_user, :logged_in?, :is_employee

    def is_employee
        if current_user
            redirect_to main_app.root_path unless current_user.admin == true
        else 
            redirect_to main_app.root_path
        end
    end
end 