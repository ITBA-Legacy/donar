class UsersController < ApplicationController

  inherit_resources

  FIELDS = [:email, :first_name, :last_name, :organizations]

  def resource_params
    return [] if request.get?
    [params.require(:user).permit(FIELDS)]
  end

end
