require_dependency 'site/application_controller'

module Site
  class ProjectsController < ApplicationController 
    before_action :set_project

    def show
    end

    private
    
    def set_project
      @project = Site::Project.friendly.find(params[:id])
    end

  end
end