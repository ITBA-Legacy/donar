class Campaign < ActiveRecord::Base
  belongs_to :organization
  has_many :perks
  has_many :comments
  has_many :updates
  has_many :contributions
  has_many :milestones
end
