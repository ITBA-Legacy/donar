class ContributionsController < ApplicationController

  inherit_resources

  before_action :authenticate_user!
  nested_belongs_to :organization, :campaign

  FIELDS = [:amount]

  def create
    # @contribution = CreateContributionContext.new(current_user).handle(
    #   resource_params.first,
    #   @campaign
    # )
    create! { organization_campaign_path(@organization, @campaign) }
  end

  def resource_params
    return [] if request.get?
    [params.require(:contribution).permit(FIELDS)]
  end

end
