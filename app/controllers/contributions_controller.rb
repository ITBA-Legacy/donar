class ContributionsController < ApplicationController

  inherit_resources

  before_action :authenticate_user!
  nested_belongs_to :organization, :campaign

  FIELDS = [:amount]

  def create
    create! do
      if @contribution.valid?
        @contribution.user = current_user
        @contribution.save!
        organization_campaign_path(@organization, @campaign)
      end
    end
  end

  def resource_params
    return [] if request.get?
    [params.require(:contribution).permit(FIELDS)]
  end

end
