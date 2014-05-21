class OrganizationsController < ApplicationController

  inherit_resources

  before_action :authenticate_user!

  FIELDS = [:name, :description, :locality]

  def list
    @organizations = current_user.organizations
  end

  def create
    create! do
      @organization.users << current_user
      organization_path @organization
    end
  end

  def resource_params
    return [] if request.get?
    [params.require(:organization).permit(FIELDS)]
  end

end
