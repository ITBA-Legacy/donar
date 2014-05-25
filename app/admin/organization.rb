ActiveAdmin.register Organization do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  permit_params :name, :description, :locality

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :locality
    column :created_at
    actions
  end

  filter :name
  filter :description
  filter :locality
end
