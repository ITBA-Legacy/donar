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
    @milestone.achieve
    @milestone.update_attributes!(description: params[:milestone][:description])
    redirect_to organization_campaign_path(@milestone.campaign.organization, @milestone.campaign),
                notice: t('campaigns.milestone_achieved')
  end

end
