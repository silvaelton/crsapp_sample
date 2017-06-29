require_dependency 'manager/application_controller'

module Manager
  class ConsultsController < ApplicationController 
    before_action :authenticate_user!
    before_action :set_project
    before_action :set_consult, only: [:edit, :update, :destroy]

    def index
      @consults = @project.consults.order(created_at: :asc)
    end

    def new
      @consult  = @project.consults.new
    end

    def create
      @consult  = @project.consults.new(set_params)

      if @consult.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update

      if @consult.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def destroy
      @consult.destroy

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:project).permit(:name, :email, :password, :situation)
    end

    def set_project
      @project = Manager::Project.find(params[:project_id])
    end

    def set_consult
      @consult = @project.consults.find(params[:id])
    end

  end
end
