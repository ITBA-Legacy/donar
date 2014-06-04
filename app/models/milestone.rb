class Milestone < ActiveRecord::Base
  belongs_to :campaign

  include AASM

  aasm do
    state :notAchieved, initial: true
    state :achieved
    state :approved

    event :achieve do
      transitions from: :notAchieved, to: :achieved
    end

    event :aprove do
      transitions from: :achieved, to: :approved
    end
  end
end
