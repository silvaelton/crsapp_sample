require_dependency 'manager/application_controller'

module Manager
  class DashboardController < ApplicationController 
    before_action :authenticate_user!

    def index
      redirect_to project_path(1)
    end
  end
end