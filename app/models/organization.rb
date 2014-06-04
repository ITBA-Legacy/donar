class Organization < ActiveRecord::Base
  has_many :campaigns
  has_and_belongs_to_many :users
  has_many :comments, as: :commentable

  validates :name, :description, :locality, presence: true

end
