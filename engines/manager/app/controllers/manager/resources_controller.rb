require_dependency 'manager/application_controller'

module Manager
  class ResourcesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project

    def index
      @resources = Resource.all
    end

    private

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end
  end
end
