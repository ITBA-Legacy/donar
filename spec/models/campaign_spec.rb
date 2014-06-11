require 'spec_helper'

describe Campaign do

  let(:campaign) { build(:campaign) }

  describe '#create' do

    context 'Creating an invalid campaign' do

      it 'validates the name' do
        campaign.name = nil
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:name)
      end

      it 'validates the description' do
        campaign.description = nil
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:description)
      end

      it 'validates the goal not to be nil' do
        campaign.goal = nil
        expect(campaign.valid?).to be false
        expect(campaign).to have(2).error_on(:goal)
      end

      it 'validates the goal to be a number' do
        campaign.goal = Faker::Lorem.characters(3)
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:goal)
      end

      it 'validates the goal to be positive' do
        campaign.goal = -1
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:goal)
      end

      it 'validates the minimum pledge not to be nil' do
        campaign.minimum = nil
        expect(campaign.valid?).to be false
        expect(campaign).to have(2).error_on(:minimum)
      end

      it 'validates the minimum pledge to be a number' do
        campaign.minimum = Faker::Lorem.characters(3)
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:minimum)
      end

      it 'validates the minimum pledge to be positive' do
        campaign.minimum = -1
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:minimum)
      end

      it 'validates the short description' do
        campaign.short_description = nil
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:short_description)
      end

      it 'validates the deadline not to be nil' do
        campaign.deadline = nil
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:deadline)
      end

      it 'validates the deadline to be after the current date' do
        campaign.deadline = Time.current - 2.days
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:deadline)
      end

      it 'validates the locality' do
        campaign.locality = nil
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:locality)
      end

      it 'validates the category inclusion' do
        campaign.category = Faker::Lorem.characters(3)
        expect(campaign.valid?).to be false
        expect(campaign).to have(1).error_on(:category)
      end

    end

    context 'Creating a valid campaign' do

      it 'creates the campaign' do
        expect(campaign.valid?).to be true
      end

    end

  end

  describe '#add_contribution' do

    it 'increases the contribution' do
      expect { campaign.add_contribution(10) }.to change(campaign, :contribution).by(10)
    end
  end

  describe '#fund campaign' do
    it 'takes a compaign through the funded lifecycle' do
      campaign.approve
      campaign.start
      while(campaign.goal>campaign.contribution) do
        campaign.add_contribution(100)
      end
      expect(campaign.started_funded?).to be true
      campaign.close
      expect(campaign.closed_funded?).to be true
    end
  end

  describe '#not_fund_campaign' do
    it 'change states without funding' do
      expect(campaign.pending?).to be true
      campaign.approve
      expect(campaign.approved?).to be true
      campaign.start
      expect(campaign.started_not_funded?).to be true
      campaign.close
      expect(campaign.closed_not_funded?).to be true
    end
  end


end
