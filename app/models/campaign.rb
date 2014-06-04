# It's a Campaign/Project/Fundriser to raise something.
class Campaign < ActiveRecord::Base

  include PgSearch
  pg_search_scope :search,
                  against: [:name, :description, :short_description],
                  using: { tsearch: { dictionary: 'spanish' } }

  belongs_to :organization
  has_many :perks
  has_many :comments, as: :commentable
  has_many :updates
  has_many :contributions
  has_many :milestones

  accepts_nested_attributes_for :perks, reject_if: :all_blank, allow_destroy: true

  CATEGORIES = [:education, :social, :health]

  validates :category, inclusion: { in: CATEGORIES.map(&:to_s) }
  validates :name, :description, :goal, :minimum, :short_description, :locality, presence: true
  validates :minimum, :goal, numericality: { greater_than: 0 }
  validates :deadline, timeliness: { on_or_after: -> { Date.current } }

  mount_uploader :main_image, CampaignImageUploader
  mount_uploader :video, CampaignVideoUploader

  after_initialize :default_attributes

  def add_contribution(amount)
    update_attributes!(contribution: contribution + amount)
  end

  def next_unachieved_milestone
    milestones.each do |milestone|
      return milestone unless milestone.achieved?
    end
    nil
  end

  private

  def default_attributes
    self.contribution ||= 0.0
  end

end
