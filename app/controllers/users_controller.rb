class UsersController < ApplicationController

  inherit_resources

  FIELDS = [:email, :organizations]

  def resource_params
    return [] if request.get?
    [params.require(:organization).permit(FIELDS)]
  end

end
