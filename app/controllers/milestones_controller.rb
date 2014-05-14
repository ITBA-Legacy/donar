class MilestonesController < ApplicationController

  inherit_resources

  before_action :authenticate_user!
  nested_belongs_to :organization, :campaign

  def create
    create! { organization_campaign_path(@organization, @campaign) }
  end

end
