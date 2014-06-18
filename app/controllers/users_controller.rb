class UsersController < ApplicationController

  inherit_resources

  before_action :authenticate_user!

  FIELDS = [:first_name, :last_name, :email, :avatar, :password, :password_confirmation]

  def resource_params
    return [] if request.get?
    [params.require(:user).permit(FIELDS)]
  end

  def update_password
    if current_user.update_attributes(resource_params.first)
      sign_in(current_user, bypass: true)
      render :show
    else
      render :edit_password
    end
  end

end
