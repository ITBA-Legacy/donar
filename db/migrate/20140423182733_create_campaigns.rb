class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.double :goal
      t.datetime :deadline
      t.double :minimum
      t.string :category
      t.string :locality
      t.references :organization, index: true
      t.text :short_description

      t.timestamps
    end
  end
end
