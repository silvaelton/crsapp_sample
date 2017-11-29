module Manager
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'manager/project'

    helper_method :authenticate_user!, :current_user

    private

    def authenticate_user!
      redirect_to new_session_path if !current_user
    end

    def current_user
      Manager::User.find(session[:user_id]) rescue false
    end

  end
end
