# It's a Campaign/Project/Fundriser to raise something.
class Campaign < ActiveRecord::Base

  include PgSearch
  pg_search_scope :search,
    :against => [:name, :description, :short_description],
    :using => {
      :tsearch => {
        :dictionary => "spanish"
      }
    },
    :ignoring => :accents


  belongs_to :organization
  has_many :perks
  has_many :comments
  has_many :updates
  has_many :contributions
  has_many :milestones

  CATEGORIES = ['Education', 'Social', 'Health']

  validates :category, :inclusion => CATEGORIES
  validates :name, :description, :goal, :minimum, :short_description, :locality, presence: true
  validates_numericality_of :minimum, :goal, greater_or_equal_to: 1
  validates_date :deadline, on_or_after: lambda { Date.current }

end
