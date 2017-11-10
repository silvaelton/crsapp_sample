require_dependency 'manager/application_controller'

module Manager
  class ParticipationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project

    layout 'manager/project'

    def index
      @participations = Participation.all.order(:id)
    end

    def show
    end

    private

    def set_project
      @project = Manager::Project.friendly.find(params[:project_id])
    end

  end
end
