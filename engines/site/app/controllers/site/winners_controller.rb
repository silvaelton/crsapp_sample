require_dependency 'site/application_controller'

module Site
  class WinnersController
    before_action :set_project

    def index
    end

    def winners
    end

    private

    def set_project
      @project = Site::Project.friendly.find(params[:project_id])
    end
  end
end
