class CreateOrganizationContext

  def initialize(current_user)
    @current_user = current_user
  end

  def handle(params)
    organization = Organization.new(params)
    organization.users << @current_user
    organization
  end

end
