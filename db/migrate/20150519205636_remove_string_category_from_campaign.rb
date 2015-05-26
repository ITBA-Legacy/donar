class RemoveStringCategoryFromCampaign < ActiveRecord::Migration
  def change
  	remove_column :campaigns, :category
  end
end
