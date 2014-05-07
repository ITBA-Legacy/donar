require 'spec_helper'

describe CreateOrganizationContext do

  let(:params) { attributes_for(:organization) }
  let(:user) { create(:user) }
  let(:context) { CreateOrganizationContext.new(user) }

  describe '#handle' do

    context 'Creating an organization' do

      it 'assigns the current user' do
        organization = context.handle(JSON.parse(params.to_json))
        expect(organization.valid?).to be true
        expect(organization.users).to include(user)
      end

    end

  end

end
