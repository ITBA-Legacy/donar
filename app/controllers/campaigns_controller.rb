class CampaignsController < ApplicationController

  inherit_resources

  FIELDS = [:name, :description, :goal, :deadline, :minimum, :category, :short_description, :locality]

  def resource_params
    return [] if request.get?
    [params.require(:campaign).permit(FIELDS)]
  end

end
