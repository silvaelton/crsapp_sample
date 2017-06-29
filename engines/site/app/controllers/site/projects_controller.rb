require_dependency 'site/application_controller'

module Site
  class ConsultsController < ApplicationController 
    before_action :set_project

    def show
    end
    
    private
    
    def set_project
      @project = Site::Project.find(params[:id])
    end

  end
end