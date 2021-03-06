require_dependency 'site/application_controller'

module Site
  class ConsultsController < ApplicationController 
    before_action :set_project

    def index
      redirect_to action: :new
    end

    def new
      @consult = @project.consults.new
    end

    def create
      @consult = @project.consults.new(set_params)

      if verify_recaptcha && @consult.save 
        flash[:success] = t :success
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:consult).permit(:content)
    end

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end
  end
end