class ChangeGoalPercentageInMilestone < ActiveRecord::Migration
  def change
     rename_column :milestones, :goal_percentage, :amount
     change_column :milestones, :amount, :int
  end
end
