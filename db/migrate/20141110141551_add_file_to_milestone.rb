class AddFileToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :file, :string
  end
end
