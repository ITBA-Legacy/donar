class Contribution < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :perk
  belongs_to :user

  has_one :purchase

  validates :amount, numericality: { greater_than: 0 }
  validate :amount_canot_be_less_than_perk

  def amount_canot_be_less_than_perk
  	errors.add(:perk, "error") if perk.amount > amount
  end

end
