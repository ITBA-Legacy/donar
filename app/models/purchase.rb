class Purchase < ActiveRecord::Base
  belongs_to :contribution

  validates :status, presence: true
end
