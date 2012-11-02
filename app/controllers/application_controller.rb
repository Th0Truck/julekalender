class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
        #redirect_to(root_url) if current_user.nil?
    rescue
      #redirect_to root_url, :alert => t('generic.requirelogin')
    end
  end
end
