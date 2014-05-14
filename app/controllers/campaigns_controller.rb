class CampaignsController < ApplicationController

  inherit_resources

  before_action :authenticate_user!
  belongs_to :organization

  FIELDS = [:name, :description, :goal, :deadline, :minimum, :category, :short_description,
            :locality]

  def resource_params
    return [] if request.get?
    [params.require(:campaign).permit(FIELDS)]
  end

  def search
    @campaigns = Campaign.search(params[:query])

    render :index
  end

end
