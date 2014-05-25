ActiveAdmin.register Campaign do

  permit_params :name, :description, :goal, :deadline, :minimum, :category, :locality,
                :organization_id, :short_description,
                perks_attributes: [:amount, :name, :maximum, :description]

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :goal
    column :deadline
    column :category
    column :locality
    actions
  end

  filter :organization
  filter :name
  filter :category
  filter :goal
  filter :locality

  form do |f|
    f.inputs Campaign.model_name.human do
      f.input :name
      f.input :description
      f.input :goal, min: 0.0
      f.input :deadline, as: :datepicker
      f.input :minimum, min: 0.0
      f.input :category, as: :select, collection: Campaign::CATEGORIES
      f.input :locality
      f.input :organization
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
      row :organization
      row :short_description
      row :created_at
    end
    panel Perk.model_name.human(count: 2) do
      if campaign.perks.empty?
        t('application.no_results')
      else
        table_for campaign.perks do
          column Perk.human_attribute_name(:amount), :amount
          column Perk.human_attribute_name(:name), :name
          column Perk.human_attribute_name(:description), :description
          column Perk.human_attribute_name(:maximum), :maximum
        end
      end
    end
    active_admin_comments
  end

end
