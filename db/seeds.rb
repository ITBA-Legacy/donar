# encoding: utf-8
Dir[Rails.root.join("db/helpers/*.rb")].each { |f| require f }

case Rails.env

when "development"
  UsersCreationHelper.create_users
  OrganizationsCreationHelper.create_organizations(5)
  CampaignsCreationHelper.create_campaigns(25)
when "staging"
  UsersCreationHelper.create_users
when "production"
  UsersCreationHelper.create_users
end
