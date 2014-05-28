class MilestonesController < ApplicationController

  inherit_resources

  before_action :authenticate_user!
  nested_belongs_to :organization, :campaign

  def create
    create! { organization_campaign_path(@organization, @campaign) }
  end

  def achieve
    @milestone = Milestone.find(params[:id])
  end

  def confirm_achieved
    @milestone = Milestone.find(params[:id])
    @campaign = @milestone.campaign
    @milestone.achieve
    @milestone.description = params[:milestone][:description]
    @milestone.save
    redirect_to organization_campaign_path(@campaign.organization, @campaign),
                notice: t('campaigns.milestone_achieved')
  end

end
