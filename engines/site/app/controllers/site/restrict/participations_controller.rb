require_dependency 'site/application_controller'

module Site
  module Restrict
    class ParticipationsController < ApplicationController # :nodoc:
      before_action :authenticate_candidate!
      before_action :set_project
      before_action :set_participation_type, only: [:create]

      def index
        if current_candidate.participation.present?
          @participations = current_candidate.participation.participation_documents

          @document_1 = current_candidate.participation.participation_documents.new(participation_type_id: 1)
          @document_2 = current_candidate.participation.participation_documents.new(participation_type_id: 2)
          @document_3 = current_candidate.participation.participation_documents.new(participation_type_id: 3)
          @document_4 = current_candidate.participation.participation_documents.new(participation_type_id: 4)
          @document_5 = current_candidate.participation.participation_documents.new(participation_type_id: 5)
          @document_6 = current_candidate.participation.participation_documents.new(participation_type_id: 6)
        else
          @participation = current_candidate.participations.new
          @participation.save

          flash[:success] = 'Envio de projeto iniciado com sucesso!'
          redirect_to action: :index
        end
      end

      def create
        @document_1 = current_candidate.participation.participation_documents.new(participation_type_id: 1)
        @document_2 = current_candidate.participation.participation_documents.new(participation_type_id: 2)
        @document_3 = current_candidate.participation.participation_documents.new(participation_type_id: 3)
        @document_4 = current_candidate.participation.participation_documents.new(participation_type_id: 4)
        @document_5 = current_candidate.participation.participation_documents.new(participation_type_id: 5)
        @document_6 = current_candidate.participation.participation_documents.new(participation_type_id: 6)

        @document = current_candidate.participation.participation_documents.new(set_params)
        @document.participation_type_id = @participation_type.id

        if @document.save
          flash[:success] =  "Operação realizada com sucesso!"
          redirect_to action: :index
        else

          instance_variable_set("@document_#{@participation_type.id}", @document)

          flash[:danger] = "Não foi possível enviar o arquivo, verifique o formulário."
          render action: :index
        end
      end

      def destroy
        if !current_candidate.participation.closed
          @document = current_candidate.participation.participation_documents.find(params[:id]) rescue nil
          @document.destroy
        end
        
        redirect_to action: :index
      end

      def close

        if current_candidate.participation.complete?
          current_candidate.participation.update(closed: true, closed_date: Date.current)
          flash[:success] = 'Seu projeto foi finalizado com sucesso!'
        end

        redirect_to action: :index
      end

      def unclose

        if current_candidate.participation.complete?
          current_candidate.participation.update(closed: false, closed_date: Date.current)
          flash[:success] = 'Seu projeto foi finalizado com sucesso!'
        end

        redirect_to action: :index
      end

      private

      def set_params
        params.fetch(:participation_document, {}).permit(:document)
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
