require_dependency 'manager/application_controller'

module Manager
  class UsersController < ApplicationController 
    before_action :authenticate_user!
    before_action :set_user

    def index
      @users = Manager::User.all.order(created_at: :asc)
    end

    def new
      @user  = Manager::User.new
    end

    def create
      @user  = Manager::User.new(set_params)

      if @user.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update

      if params[:user][:password].blank?
        params[:user].delete :password
        params[:user].delete :password_confirmation
      end

      if @user.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def destroy
    end

    private

    def set_params
      params.require(:user).permit(:name, :email, :password, :situation)
    end

    def set_user
      @user = Manager::User.find(params[:id])
    end

  end
end
