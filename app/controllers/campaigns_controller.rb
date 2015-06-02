class CampaignsController < ApplicationController
  inherit_resources
  before_action :authenticate_user!, except: [:search, :index, :show]
  belongs_to :organization, optional: true

  FIELDS = [:category_id, :name, :description, :goal, :deadline, :minimum, :short_description,
            :locality, :main_image, :video, :history, :country,
            perks_attributes: [:id, :amount, :name, :maximum, :description,
                               :_destroy, :delivery_date, :requires_address]]

  def search
    @campaigns = Campaign.search(params[:query]).page(params[:page] || 1).per(10)
    render :index
  end

  def subregion_options
    render partial: 'subregion_select'
  end

  def index
    index! { @campaigns = @campaigns.page(params[:page] || 1).per(10) }
  end

  def create
    create! do |success|
      success.html { redirect_to configure_campaign_path(@campaign) } if @campaign.valid?
    end
  end

  def configure
    @campaign = Campaign.find(params[:id])
  end

  def configure_step2
    @campaign = Campaign.find(params[:id])
    @campaign.milestones.destroy_all
    error = generate_milestones(@campaign)
    error ? (render 'configure') : (save_campaign(@campaign))
  end

  def configure_step3
    @campaign = Campaign.find(params[:id])
    @campaign.update_attributes!(resource_params.first)
    redirect_to campaigns_path
  end

  def landing
  end

  def edit
    @organization = Organization.find(params[:organization_id])
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = update_and_milestones
    error = generate_milestones(@campaign)
    if @campaign.valid? && !error
      redirect_to campaign_path(@campaign)
    else
      @error_fields = get_error_fields(@campaign)
      render 'edit'
    end
  end

  private

  def generate_milestones(campaign)
    params[:campaign][:milestones_attributes].present? ? fetch_milestones(campaign) : true
  end

  def update_and_milestones
    campaign = Campaign.find(params[:id])
    campaign.update(update_params)
    campaign.milestones.destroy_all
    campaign
  end

  def get_error_fields(campaign)
    campaign.errors.messages.keys & FIELDS
  end

  def update_params
    params[:campaign].except(:milestones_attributes).permit(FIELDS)
  end

  def save_campaign(campaign)
    campaign.goal = params[:campaign][:goal]
    campaign.fund_recipient = params[:fund_recipient]
    campaign.funding_type = params[:funding_type]
    campaign.save!
  end

  def resource_params
    return [] if request.get?
    [params.require(:campaign).permit(FIELDS)]
  end

  def milestone_params(key_milestone)
    params[:campaign][:milestones_attributes][key_milestone].permit(:name, :description, :amount,
                                                                    :done_date)
  end

  def milestone_id(key_milestone)
    params[:campaign][:milestones_attributes][key_milestone][:id]
  end

  def fetch_milestones(campaign)
    error = false
    params[:campaign][:milestones_attributes].keys.each do |key_milestone|
      if params[:campaign][:milestones_attributes][key_milestone]['_destroy'] != '1'
        @milestone = Milestone.create(milestone_params(key_milestone))
        error ||= !@milestone.valid?
        campaign.milestones << @milestone
      end
    end
    error
  end
end
