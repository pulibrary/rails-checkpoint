# frozen_string_literal: true

module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
