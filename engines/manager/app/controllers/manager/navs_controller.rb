require_dependency 'manager/application_controller'

module Manager
  class NavsController < ApplicationController 
    before_action :authenticate_user!
    before_action :set_project
    before_action :set_nav, only: [:edit, :update, :destroy]

    layout 'manager/project'

    def index
      @navs = @project.navs.order(created_at: :asc)
    end

    def new
      @nav  = @project.navs.new
    end

    def create
      @nav  = @project.navs.new(set_params)

      if @nav.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update

      if @nav.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def destroy
      @nav.destroy

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:nav).permit(:link, :label, :url, :page_type, :active, :page_id, :order)
    end

    def set_project
      @project = Manager::Project.find(params[:project_id])
    end

    def set_nav
      @nav = @project.navs.find(params[:id])
    end

  end
end
