require 'spec_helper'

describe MilestonesController do

  let(:organization) { create(:organization) }
  let(:campaign) { create(:campaign, organization: organization) }
  let(:milestone) { create(:milestone, campaign: campaign) }
  let(:user) { create(:user, organizations: [organization]) }

  describe 'POST create' do

    context 'When achieving a milestone for a campaign' do

      before(:each) do
        sign_in(user)
        user.reload
      end

      it 'confirms achieved the milestone' do
        patch :confirm_achieved, organization_id: organization.id,
                                 campaign_id: campaign.id,
                                 id: milestone.id,
                                 milestone: { description: 'bla' }
        milestone.reload
        expect(milestone.description).to eq 'bla'
        expect(milestone.achieved?).to be true

      end

      # before(:each) do
      #   sign_in(user)
      #   user.reload
      # end

      # it 'assigns the organization to the campaign' do
      #   post :create, organization_id: organization.id, campaign: campaign
      #   expect(Campaign.last.organization).to eq organization
      # end

      # it 'redirects to the campaign view' do
      #   post :create, organization_id: organization.id, campaign: campaign
      #   expect(response).to redirect_to organization_campaign_url(organization, Campaign.last)
      # end

      # it 'creates the campaign' do
      #   expect do
      #     post :create, organization_id: organization.id, campaign: campaign
      #   end.to change(Campaign, :count).by(1)
      # end

    end

  end

end
