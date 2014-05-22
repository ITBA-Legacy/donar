ActiveAdmin.register Campaign do

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

permit_params :name, :description, :goal, :deadline, :minimum, :category,:locality,
  :organization_id, :short_description

  index do
    column :id
    column :name
    column :description
    column :goal
    column :deadline
    column :category
    column :locality
    actions
  end

  form do |f|
    f.inputs Campaign.model_name.human do
      f.input :name
      f.input :description
      f.input :goal, min: 0.0
      f.input :deadline
      f.input :minimum, min: 0.0
      f.input :category
      f.input :locality
      f.input :organization_id
      f.input :short_description
      f.has_many :perks do |cf|
          cf.input :amount, min: 0.0
          cf.input :name
          cf.input :maximum, min: 1
          cf.input :description
      end
    end
    f.actions
  end

  show do |campaign|
    attributes_table do
      row :name
      row :description
      row :goal
      row :deadline
      row :minimum
      row :category
      row :locality
      row :organization_id
      row :short_description
    end
    active_admin_comments
  end



end
