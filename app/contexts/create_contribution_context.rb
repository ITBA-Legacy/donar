class CreateContributionContext

  def initialize(current_user)
    @current_user = current_user
  end

  def handle(params, campaign)
    contribution = Contribution.new(params)
    contribution.campaign = campaign
    contribution.user = @current_user
    contribution
  end

end
