ActiveAdmin.register Organization do

  permit_params :name, :description, :locality

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :locality
    column :created_at
    actions defaults: false do |organization|
      link_to "Aprobar", '/admin', class: "button"
    end
    actions defaults: false do |organization|
      link_to "Rechazar", '/admin', class: "button"
    end
    actions
  end

  filter :name
  filter :description
  filter :locality
end
