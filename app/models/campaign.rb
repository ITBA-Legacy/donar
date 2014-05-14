class Campaign < ActiveRecord::Base
  belongs_to :organization
  has_many :perks
  has_many :comments
  has_many :updates
  has_many :contributions
  has_many :milestones

  accepts_nested_attributes_for :organization, :perks
  accepts_nested_attributes_for :perks, allow_destroy: true

  CATEGORIES = [:education, :social, :health]

  validates :category, inclusion: { in: CATEGORIES.map(&:to_s) }
  validates :name, :description, :goal, :minimum, :short_description, :locality, presence: true
  validates :minimum, :goal, numericality: { greater_than: 0 }
  validates :deadline, timeliness: { on_or_after: -> { Date.current } }

  after_initialize :default_attributes

  def add_contribution(amount)
    update_attributes!(contribution: contribution + amount)
  end

  private

  def default_attributes
    self.contribution ||= 0.0
  end

end
