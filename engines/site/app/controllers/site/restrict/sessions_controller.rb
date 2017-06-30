require_dependency 'site/application_controller'

module Site
  module Restrict
    class SessionsController < Site::ApplicationController 
      
      before_action :set_project

      def new
        @session = Site::Session.new
      end

      def create
        @session = Site::Session.new(set_params)

        if @session.valid?
          session[:candidate_id] = @session.id
          redirect_to project_restrict_candidates_path(@project)
        else
          render action: :new
        end
      end

      def destroy
        session[:candidate_id] = nil

        redirect_to action: :new
      end

      private

      def set_params
        params.require(:session)
              .permit(:candidate_id, :password)
      end

      def set_project
        @project = Site::Project.friendly.find(params[:project_id])
      end
    
    end
  end
end
