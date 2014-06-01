ActiveAdmin.register Organization do

  permit_params :name, :description, :locality

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :locality
    column :created_at
    actions defaults: false do
      link_to t('active_admin.approve'), '#', class: 'button',
                                              onclick: 'alert("Organización Aprobada")'
    end
    actions defaults: false do
      link_to t('active_admin.reject'), '#', class: 'button',
                                             onclick: 'alert("Organización Rechazada")'
    end
    actions
  end

  filter :name
  filter :description
  filter :locality
end
