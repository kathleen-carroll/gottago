class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  add_flash_types :success

  def current_user
    @current_user ||= User.last if User.all != []#User.find(session[:user_id]) if session[:user_id]
  end

  def four_oh_four
    raise ActionController::RoutingError.new('Not Found')
  end
end
