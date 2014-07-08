ActiveAdmin.register User do

  permit_params :first_name, :last_name, :email, :avatar

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :created_at
    column :sign_in_count
    column :last_sign_in_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :email

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :avatar
    end
  end

  form do |f|
    f.inputs User.model_name.human do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.actions
    end
  end


end
