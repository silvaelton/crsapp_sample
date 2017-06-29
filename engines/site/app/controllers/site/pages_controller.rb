require_dependency 'site/application_controller'

module Site
  class PagesController < ApplicationController 

    before_action :set_project

    def show
      @page = Site::Page.friendly.find(params[:id])
    end

    private

    def set_project
      @project = Site::Project.find(params[:id])
    end
    
  end
end