class AddFileToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :file, :oid
  end
end
