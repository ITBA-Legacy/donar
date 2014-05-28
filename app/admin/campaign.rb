ActiveAdmin.register Campaign do

  permit_params :name, :description, :goal, :deadline, :minimum, :category, :locality,
                :organization_id, :short_description,
                perks_attributes: [:id, :amount, :name, :maximum, :description, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :goal do |campaign|
      "$#{campaign.goal}"
    end
    column :deadline
    column :category do |campaign|
      t("campaigns.categories.#{campaign.category}")
    end
    column :locality
    actions
  end

  filter :organization
  filter :name
  filter :category,
         as: :select,
         collection: Campaign::CATEGORIES.map { |c| [I18n.t("campaigns.categories.#{c}"), c] }
  filter :goal
  filter :locality

  form do |f|
    f.inputs Campaign.model_name.human do
      f.input :name
      f.input :description
      f.input :goal, min: 0.0
      f.input :deadline, as: :datepicker
      f.input :minimum, min: 0.0
      f.input :category,
              as: :select,
              collection: Campaign::CATEGORIES.map { |c| [t("campaigns.categories.#{c}"), c] }
      f.input :locality
      f.input :organization
      f.input :short_description
      f.has_many :perks do |cf|
        cf.input :amount, min: 0.0
        cf.input :name
        cf.input :maximum, min: 1
        cf.input :description
        cf.input :_destroy, as: :boolean, required: false, label: t('active_admin.remove')
      end
    end
    f.actions
  end

  show do |campaign|
    attributes_table do
      row :name
      row :description
      row :goal do
        "$ #{campaign.goal}"
      end
      row :deadline
      row :minimum do
        "$ #{campaign.minimum}"
      end
      row :category do
        t("campaigns.categories.#{campaign.category}")
      end
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
          column Perk.human_attribute_name(:amount), :amount do |perk|
            "$ #{perk.amount}"
          end
          column Perk.human_attribute_name(:name), :name
          column Perk.human_attribute_name(:description), :description
          column Perk.human_attribute_name(:maximum), :maximum
        end
      end
    end
    active_admin_comments
  end

end
