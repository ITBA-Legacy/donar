class OrganizationsController < ApplicationController

  inherit_resources

  before_action :authenticate_user!, except: [:index, :show]

  FIELDS = [:name, :description, :locality]

  def list
    @organizations = current_user.organizations
  end

  def create
    create! do
      if @organization.valid?
        @organization.users << current_user
        organization_path @organization
      end
    end
  end

  def resource_params
    return [] if request.get?
    [params.require(:organization).permit(FIELDS)]
  end

end
