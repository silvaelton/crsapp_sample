require_dependency 'manager/application_controller'

module Manager
  class CandidatesController < ApplicationController 
    before_action :authenticate_user!
    before_action :set_project
    before_action :set_candidate, only: [:edit, :update, :destroy]

    def index
      @candidates = @project.candidates.order(created_at: :asc)
    end

    def new
      @candidate  = @project.candidates.new
    end

    def edit
    end

    def update

      if @candidate.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def destroy
      @candidate.destroy

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:project).permit(:name, :email, :password, :situation)
    end

    def set_project
      @project = Manager::Project.find(params[:project_id])
    end

    def set_consult
      @candidate = @project.consults.find(params[:id])
    end

  end
end
