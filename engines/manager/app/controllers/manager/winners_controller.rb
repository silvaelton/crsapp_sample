require_dependency 'manager/application_controller'

module Manager
  class WinnersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project

    def index
      @winners = @project.winners.order(:winner_type)
    end

    def new
      @winner = @project.winners.new
    end

    def create
      @winner = @project.winners.new(set_params)
      @winner.save
    end

    def show
      @winner = @project.winners.find(params[:id])
    end

    def destroy
      @winner = @project.winners.find(params[:id])
      @winner.destroy

      flash[:success] =  t :success
      redirect_to action: :index
    end

    private

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end

    def set_params
      params.require(:winner).permit(:participation_id, :winner_type)
    end
  end
end
