require_dependency 'manager/application_controller'

module Manager
  class CandidatesController < ApplicationController 
    before_action :authenticate_user!
    before_action :set_project
    before_action :set_candidate, only: [:edit, :update, :destroy]

    layout 'manager/project'
    
    def index
      @candidates = @project.candidates.order(created_at: :asc)
    end

    def edit
    end

    def update

      if @candidate.update(set_params)
        flash[:success] = t :success

        if @candidate.homologado?
          Site::CandidateMailer.homolog(@candidate).deliver_now! 
        end
        
        redirect_to action: :edit
      else
        render action: :edit
      end
    end

    private

    def set_params
      params.require(:candidate).permit(:status, :observation)
    end

    def set_project
      @project = Manager::Project.friendly.find(params[:project_id])
    end

    def set_candidate
      @candidate = @project.candidates.find(params[:id])
    end

  end
end
