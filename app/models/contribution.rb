class Contribution < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :perk
  belongs_to :user

  validates :amount, numericality: { greater_than: 0.0 }

  after_create :add_campaign_contribution

  private

  def add_campaign_contribution
    campaign.add_contribution(amount)
  end

end
