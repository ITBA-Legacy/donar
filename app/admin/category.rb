ActiveAdmin.register Category do

  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  show do |user|
    attributes_table do
      row :name
    end
  end

  form do |f|
    f.inputs Category.model_name.human do
      f.input :name
      f.actions
    end
  end

end
