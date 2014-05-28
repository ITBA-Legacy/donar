class CommentsController < ApplicationController
  inherit_resources

  before_action :authenticate_user!
  polymorphic_belongs_to :campaign, :organization

  FIELDS = [:message]

  def create
    build_resource.user = current_user
    create! { parent_url }
  end

  def begin_of_association_chain
    @begin_of_association_chain ||= current_user
  end

  def resource_params
    return [] if request.get?
    [params.require(:comment).permit(FIELDS)]
  end
end
