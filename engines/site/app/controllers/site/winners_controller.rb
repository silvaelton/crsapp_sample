require_dependency 'site/application_controller'

module Site
  class WinnersController < ApplicationController
    before_action :set_project

    def index
      @participations = Participation.where(closed: true).order(id: :asc)
    end

    def all
      @winners = @project.winners.order(id: :asc)
    end

    private

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end
  end
end
