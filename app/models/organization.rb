class Organization < ActiveRecord::Base
  has_many :campaigns
  has_and_belongs_to_many :users
end