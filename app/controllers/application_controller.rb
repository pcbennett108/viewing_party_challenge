class ApplicationController < ActionController::Base
  helper_method :current_user, :inactive_session?

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def inactive_session?
    !current_user
  end

end
