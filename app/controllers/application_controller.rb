# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  

  helper_method :current_user
  helper_method :logged?

  protected

    def login_required  
      unless current_user.nil?
        unless current_user.confirmation_ok?
          flash[:error] = "Waiting confirmantion of your account!"
          redirect_to login_path
          return false
        end
      else
        flash[:error] = "You need to be logged in!"
        redirect_to login_path
        false
      end
    end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def logged?
    not current_user.nil?
  end
end
