require_dependency 'site/application_controller'

module Site
  class QuestionTwoController < ApplicationController 
    before_action :set_project

    def index
      redirect_to action: :new
    end

    def new
      @question = ::QuestionTwo.where(project_id: @project.id).new
    end

    def create
      @question = ::QuestionTwo.where(project_id: @project.id).new(set_params)
      
      if verify_recaptcha && @question.save 
        flash[:success] = t :success

        @control_number = ::QuestionTwo.where(project_id: @project.id)
                                        .order(created_at: :asc)
                                        .map(&:candidate_id)
                                        .find_index(@question.candidate_id)
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:question_two).permit(:cpf, :password, :name, :candidate_id, :term_use)
    end

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end
  end
end