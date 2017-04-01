class UsersController < ApplicationController
  before_action :current_user, except: [:show]

  def show
    set_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:name, :age, :address,
                                   :email, :password)
    end
end