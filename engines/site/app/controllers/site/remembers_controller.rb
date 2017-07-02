require_dependency 'site/application_controller'

module Site
  class RemembersController < ApplicationController 
    before_action :set_project

    def index
      @candidate = @project.candidates.find_by(cpf: params[:cpf].gsub('.', '').gsub('-','')) rescue nil 
    end

    def new
      @candidate = @project.candidates.find(params[:candidate_id]) rescue nil 
      
      if !@candidate.nil?
        @candidate.update(token: SecureRandom.urlsafe_base64(50, false))

        Site::CandidateMailer.remember(@candidate).deliver_now!
      end

    end
    
    def edit
      @candidate = @project.candidates.find_by(token: params[:id]) rescue nil 
    end

    def update
      @candidate = @project.candidates.find_by(token: params[:id]) rescue nil 
      if @candidate.update(set_params)
        @candidate.update(token: nil)
        redirect_to project_restrict_path(@project)
      else
        render action: :edit
      end

    end

    private

    
    def set_params
      params.require(:candidate).permit(:password, :password_confirmation)
    end

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end
  end
end