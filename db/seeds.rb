# encoding: utf-8
Dir[Rails.root.join("db/helpers/*.rb")].each { |f| require f }

case Rails.env
# milestones = [
#     Milestone.create(name: 'Construir sala tomografo', description: 'Se construyo la sala de tomografo', goal_percentage: 0.20),
#     Milestone.create(name: 'Comprar tomógrafo', description: 'Se compró el tomografo al proveedor', goal_percentage: 0.60),
#     Milestone.create(name: 'Instalar tomógrafo', description: 'Se instaló el tomografo', goal_percentage: 0.20)
#   ]
when "development"
  UsersCreationHelper.create_users
  OrganizationsCreationHelper.create_organizations(5)
  CampaignsCreationHelper.create_campaigns(25)
  AdminUser.create(
   email: 'admin@example.com',
   password: '123123123',
   password_confirmation: '123123123',
  )
when "staging"
  UsersCreationHelper.create_users
  OrganizationsCreationHelper.create_organizations(5)
  CampaignsCreationHelper.create_campaigns(25)
  AdminUser.create(
   email: 'admin@example.com',
   password: '123123123',
   password_confirmation: '123123123',
  )
when "production"
  UsersCreationHelper.create_users
end
