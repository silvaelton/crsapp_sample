require_dependency 'manager/application_controller'

module Manager
  class PagesController < ApplicationController 
    before_action :authenticate_user!
    before_action :set_project
    before_action :set_page, only: [:edit, :update, :destroy]

    layout 'manager/project'

    def index
      @pages = @project.pages.order(created_at: :asc)
    end

    def new
      @page  = @project.pages.new
    end

    def create
      @page  = @project.pages.new(set_params)

      if @page.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update

      if @page.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def destroy
      @page.destroy

      flash[:success] = t :success
      
      redirect_to action: :index
    end

    private

    def set_params
      params.require(:page).permit(:name, :content, :active)
    end

    def set_project
      @project = Manager::Project.find(params[:project_id])
    end

    def set_page
      @page = @project.pages.find(params[:id])
    end

  end
end
