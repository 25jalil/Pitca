class UsersController < ApplicationController
  before_action :authenticate_user!

  expose :users
  expose :user    

  def index
    authorize user
  end

  def show
    authorize user
  end

  def destroy
    authorize user
    user.destroy
    redirect_to new_user_session_path, notice: "User_deleted!"
  end

  def update
    authorize user
    if user.update_attributes(secure_params)
      redirect_to users_path, success: "User updated"
    else
      redirect_to users_path, alert: "Unable to update user"
    end
  end

  private

    def secure_params
      params.require(:user).permit(:role)
    end 
end
