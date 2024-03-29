class RegistersController < ApplicationController
  include SessionsAction

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = t("sign_up.create_success")
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
