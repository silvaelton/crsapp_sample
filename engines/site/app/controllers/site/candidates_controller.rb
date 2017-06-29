require_dependency 'site/application_controller'

module Site
  class CandidatesController < ApplicationController 

    before_action :set_project
    
    def index
      redirect_to action: :new
    end

    def new
      @candidate = @project.candidates.new
    end

    def create
      @candidate = @project.candidates.new(set_params)

      if @candidate.save
        flash[:success] = t(:success)
      else
        render action: :new
      end
    end

    private

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end
    
  end
end