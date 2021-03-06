require_dependency 'manager/application_controller'

module Manager
  class ProjectsController < ApplicationController 
    before_action :authenticate_user!
    before_action :set_project, only: [:edit, :update, :show]

    layout 'manager/project'

    def index
      @projects = Manager::Project.all.order(created_at: :asc)
    end

    def show
    end

    def new
      @project  = Manager::Project.new
    end

    def create
      @project  = Manager::Project.new(set_params)

      if @project.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update

      if @project.update(set_params)
        flash[:success] = t :success
        redirect_to action: :edit
      else
        render action: :edit
      end
    end

    def destroy
    end

    private

    def set_params
      params.require(:project)
            .permit(:title, :slug, :mini_description, :home_page_id, :start, 
                    :end, :subscribe_start, :subscribe_end, :allow_subscribe, 
                    :consult_start, :consult_end, :allow_consult)
    end

    def set_project
      @project = Manager::Project.friendly.find(params[:id])
    end

  end
end
