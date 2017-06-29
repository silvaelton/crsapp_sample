require_dependency 'manager/application_controller'

module Manager
  class SessionsController < ApplicationController 
    layout 'manager/session'
    
    def new
      @session = Manager::Session.new
    end

    def create
      @session = Manager::Session.new(set_params)

      if @session.valid?
        session[:user_id] = @session.id

        redirect_to manager.root_path
      else
        render action: :new
      end

    end

    def destroy
      session[:user_id] = nil 

      redirect_to manager.root_path
    end

    private

    def set_params
      params.require(:session).permit(:email, :password)
    end

  end
end