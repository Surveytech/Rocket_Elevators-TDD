require 'pg'
class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true, with: :exception  
    skip_before_action :verify_authenticity_token

    helper_method :current_user, :logged_in?, :is_employee

    def is_employee
        redirect_to root_path unless logged_in?
    end

end 