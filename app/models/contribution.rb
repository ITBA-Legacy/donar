class Contribution < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :campaign_perk
  belongs_to :user
end
