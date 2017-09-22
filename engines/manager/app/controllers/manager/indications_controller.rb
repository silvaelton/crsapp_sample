require_dependency 'manager/application_controller'

module Manager
  class IndicationsController < ApplicationController 
    before_action :authenticate_user!
    before_action :set_project

    layout 'manager/project'
    
    def index
      @indications = QuestionTwo.where(project_id: @project.id).order(created_at: :asc)
    end
 
    private

    def set_project
      @project = Manager::Project.friendly.find(params[:project_id])
    end

  end
end
