class OrganizationsController < ApplicationController

  inherit_resources

  FIELDS = [:name, :description, :locality]

  def create
    @organization = CreateOrganizationContext.new(current_user).handle(resource_params.first)
    create!
  end

  def resource_params
    return [] if request.get?
    [params.require(:organization).permit(FIELDS)]
  end

end
