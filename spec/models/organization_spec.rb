require 'spec_helper'

describe Organization do

  describe "#create" do

    context "When creating an invalid organization" do


      it "validates the name" do
        Organization.new()
      end

      it "validates the description" do
      end

      it "validates the locality" do
      end

    end

    context "When creating a valid organization" do


      it "creates the organization" do
        FactoryGirl.create(:organization)
      end

    end

  end
end
