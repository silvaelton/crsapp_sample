require_dependency 'site/application_controller'

module Site
  module Restrict
    class CandidatesController < Site::ApplicationController 

      before_action :authenticate_candidate!
      before_action :set_project
      
      def index  
      end

      def edit
      end

      def update
        if current_candidate.update(set_params)
          redirect_to project_restrict_candidates_path(@project)
        else
          render action: :edit
        end
      end


      private

      def set_params
        params.require(:candidate)
              .permit(:name, :rg, :gender, :born, :cep, :uf, 
                      :city, :burgh, :address, :telephone, :celphone, 
                      :email, :fantasy_name, :social_reason, :cnpj, 
                      :document_one, :document_two)
 
      end

      def set_project
        @project = Site::Project.friendly.find(params[:project_id])
      end

    end
  end
end