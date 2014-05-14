class OrganizationsController < ApplicationController

  inherit_resources

  FIELDS = [:name, :description, :locality]

  def resource_params
    return [] if request.get?
    [params.require(:organization).permit(FIELDS)]
  end

end
