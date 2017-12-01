require_dependency 'site/application_controller'

module Site
  class ResourcesController < ApplicationController
    before_action :set_project

    def index
      redirect_to action: :new
    end

    def new
      @resource = Resource.new
    end

    def create
      @resource = Resource.new(set_params)
      if verify_recaptcha && @resource.save
        flash[:success] = t :success
      else
        render action: :new
      end
    end


    private

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end

    def set_params
      params.require(:resource).permit(:candidate_id, :password, :message)
    end
  end
end
