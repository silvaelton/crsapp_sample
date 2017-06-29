require_dependency 'site/application_controller'

module Site
  class HomeController < ApplicationController 
        
    def index
      #reafatorar
      redirect_to site.project_path(1)
    end

  end
end
