class AddFileExtensionToMilestone < ActiveRecord::Migration
  def change
  	add_column :milestones, :file_extension, :string
  end
end
