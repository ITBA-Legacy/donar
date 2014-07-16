class ChangeUploaderForPostgreSql < ActiveRecord::Migration
  def change
    remove_column :users, :avatar
    add_column :users, :avatar, :oid
    remove_column :campaigns, :main_image
    add_column :campaigns, :main_image, :oid
  end
end
