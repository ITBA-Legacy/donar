class CampaignsController < ApplicationController

  inherit_resources

  before_action :authenticate_user!, except: [:search, :index, :show]
  belongs_to :organization, optional: true

  FIELDS = [:name, :description, :goal, :deadline, :minimum, :category, :short_description,
            :locality, :main_image, :video, :history, :country,
            perks_attributes: [:id, :amount, :name, :maximum, :description,
                               :_destroy, :delivery_date, :requires_address]]

  def search
    @campaigns = Campaign.search(params[:query]).page(params[:page] || 1).per(10)
    render :index
  end

  def index
    index! { @campaigns = @campaigns.page(params[:page] || 1).per(10) }
  end

  def create
    create! do |success|
      if @campaign.valid?
        success.html { redirect_to configure_campaign_path(@campaign) }
      end
    end
  end

  def configure
    @campaign = Campaign.find(params[:id])
    @campaign.milestones << Milestone.create() if @campaign.milestones.empty?
  end

  def configure_step2
    error = false
    @campaign = Campaign.find(params[:id])
    params[:campaign][:milestones_attributes].keys.each do |key_milestone|
      @milestone = retrieve_milestone(key_milestone)
      error |= !@milestone.valid?
      @campaign.milestones << @milestone
    end
    if !error
      @campaign.fund_recipient = params[:fund_recipient]
      @campaign.funding_type = params[:funding_type]
      @campaign.save!
    else
      render "configure"
    end


  end

  def retrieve_milestone(key_milestone)
    milestone = Milestone.find_by_id(milestone_id(key_milestone))
    if milestone
      milestone.update_attributes(milestone_params(key_milestone))
    else
      milestone = Milestone.create(milestone_params(key_milestone))
    end
    milestone
  end

  def configure_step3
    @campaign = Campaign.find(params[:id])
    @campaign.update_attributes!(resource_params.first)
    redirect_to campaigns_path
  end

  def landing

  end

  private

  def resource_params
    return [] if request.get?
    [params.require(:campaign).permit(FIELDS)]
  end

  def milestone_params(key_milestone)
    params[:campaign][:milestones_attributes][key_milestone].permit(:name, :description, :done_date, :amount)
  end

  def milestone_id(key_milestone)
    params[:campaign][:milestones_attributes][key_milestone][:id]
  end
end
