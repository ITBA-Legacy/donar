class ContributionsController < ApplicationController

  inherit_resources

  before_action :authenticate_user!
  nested_belongs_to :organization, :campaign

  FIELDS = [:amount]

  def create
    create! { organization_campaign_path(@organization, @campaign) }
  end

  def resource_params
    return [] if request.get?
    [params.require(:contribution).permit(FIELDS)]
  end

end
