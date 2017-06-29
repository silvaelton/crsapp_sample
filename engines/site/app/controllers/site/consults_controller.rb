require_dependency 'site/application_controller'

module Site
  class ConsultsController < ApplicationController 
    before_action :set_project

    def new
      @consult = @project.consults.new
    end

    def create
      @consult = @project.consults.new(set_params)

      if @consult.save
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
      @project = Site::Project.find(params[:id])
    end
  end
end