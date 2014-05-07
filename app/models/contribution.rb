class Contribution < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :perk
  belongs_to :user
end
