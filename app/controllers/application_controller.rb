class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :most_recent_tool,
                :current_user

  def most_recent_tool
    if current_user
      @tools = current_user.tools
      session[:most_recent_tool_id] = @tools.order(:created_at).last
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
