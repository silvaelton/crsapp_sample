require_dependency 'site/application_controller'

module Site
  class QuestionOneController < ApplicationController 
    before_action :set_project

    def index
      redirect_to action: :new
    end

    def new
      @question = ::QuestionOne.where(project_id: @project.id).new
    end

    def create
      @question = ::QuestionOne.where(project_id: @project.id).new(set_params)

      if verify_recaptcha && @question.save 
        flash[:success] = t :success
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:question_one).permit(:answer, :candidate_id)
    end

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end
  end
end