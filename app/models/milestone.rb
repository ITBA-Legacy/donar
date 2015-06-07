class Milestone < ActiveRecord::Base
  belongs_to :campaign
  validates :amount, :description, :done_date, :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :done_date, timeliness: { on_or_after: -> { Date.current } }

  include AASM


  mount_uploader :file, MilestoneFileUploader


  aasm do
    state :notAchieved, initial: true
    state :achieved
    state :rejected
    state :approved

    event :achieve do
      transitions from: :notAchieved, to: :achieved
      transitions from: :rejected, to: :achieved # Here some condition might be checked?
    end

    event :approve do
      transitions from: :achieved, to: :approved
    end

    event :reject do
      transitions from: :achieved, to: :rejected
    end

  end
end
