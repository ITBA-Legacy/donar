class OrganizationsController < ApplicationController

  before_action :authenticate_user!

  inherit_resources

  before_action :authenticate_user!

  FIELDS = [:name, :description, :locality]

  def list
    @organizations = current_user.organizations
    render :index
  end

  def create
    create! do
      binding.pry
      @organization.users << current_user
      organization_path @organization
    end
  end

  def resource_params
    return [] if request.get?
    [params.require(:organization).permit(FIELDS)]
  end

end
