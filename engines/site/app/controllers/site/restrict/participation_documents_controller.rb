require_dependency 'site/application_controller'

module Site
  module Restrict
    class ParticipationDocumentsController < ApplicationController # :nodoc:
      before_action :authenticate_candidate!
      before_action :set_project
      before_action :set_participation_type

      def new
        @participation = current_candidate.participation.participation_documents.new
        @participation.participation_type_id = @participation_type.id
      end

      def create
        @participation = current_candidate.participation.participation_documents.new(set_params)
        @participation.participation_type_id = @participation_type.id

        if @participation.save
          flash[:success] =  "Operação realizada com sucesso!"
          redirect_to action: :new
        else
          flash[:danger] = "Não foi possível enviar o arquivo, verifique o formulário."
          render action: :new
        end
      end

      private

      def set_params
        params.require(:participation_document).permit(:document)
      end

      def set_project
        @project = Site::Project.friendly.find(params[:project_id])
      end

      def set_participation_type
        @participation_type = ::ParticipationType.find(params[:participation_type_id])
      end
    end
  end
end
