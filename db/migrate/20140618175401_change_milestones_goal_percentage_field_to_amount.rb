class ChangeMilestonesGoalPercentageFieldToAmount < ActiveRecord::Migration
  def change
    rename_column :milestones, :goal_percentage, :amount
  end
end
