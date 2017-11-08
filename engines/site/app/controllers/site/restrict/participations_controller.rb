require_dependency 'site/application_controller'

module Site
  module Restrict
    class ParticipationsController < ApplicationController # :nodoc:

      def index
        @participations = current_candidate.participation.participation_documents
      end

      def new
        if current_candidate.participation.present?
          flash[:primary] = 'Candidato já iniciou o envio de projetos'
          redirect_to action: :index
        else
          @participation = current_candidate.participation.new
          @participation.save

          flash[:success] = 'Envio de projeto iniciado com sucesso!'
          redirect_to action: :index
        end
      end

      def close
        current_candidate.participation.update(closed: true, closed_date: Date.current)
        flash[:success] = 'Seu projeto foi finalizado com sucesso!'
        
        redirect_to action: :index
      end

    end
  end
end
