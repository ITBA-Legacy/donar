class ContributionsController < ApplicationController

  inherit_resources

  nested_belongs_to :organization, :campaign

  FIELDS = [:amount, :first_name, :last_name, :email]

  def create
    create! do
      if @contribution.valid?
        # we have to find a way to make the following two lines happen inside inherit resources...
        @contribution.user = current_user if current_user.present?
        @contribution.save!
        handle_valid_contribution
      end
    end
  end

  def resource_params
    return [] if request.get?
    [params.require(:contribution).permit(FIELDS)]
  end

  def handle_valid_contribution
    if user_signed_in?
      context = NewContributionContext.new(@contribution, request)
      context.handle
      context.redirect_url if context.success?
    else
      Purchase.create(status: :success, contribution: @contribution)
      organization_campaign_path(@organization, @campaign)
    end
  end

end
