class User < ActiveRecord::Base

  private

  def current_user
    @user.id == params[:id]
  end
end
