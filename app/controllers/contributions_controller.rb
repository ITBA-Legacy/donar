class ContributionsController < ApplicationController

  inherit_resources

  before_action :authenticate_user!
  nested_belongs_to :organization, :campaign

  FIELDS = [:amount]

  def create

    create! do
      if @contribution.valid?
        # we have to find a way to make the following two lines happen inside inherit resources...
        @contribution.user = current_user
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
    context = NewContributionContext.new(@contribution, request)
    context.handle
    context.redirect_url if context.success?
  end

end
