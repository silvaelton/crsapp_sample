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
        session[:candidate_id] = @candidate.id
        
        Site::CandidateMailer.subscribe(@candidate).deliver_now! rescue nil
        
        flash[:success] = t(:success)
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:candidate)
            .permit(:name, :cpf, :rg, :gender, :born, :cep, :uf, 
                    :city, :burgh, :address, :telephone, :celphone, 
                    :email, :fantasy_name, :social_reason, :cnpj, 
                    :password, :password_confirmation, :terms_use,
                    :document_one, :document_two)
 
    end

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end
    
  end
end