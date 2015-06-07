class Contribution < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :perk
  belongs_to :user

  has_one :purchase
  validates :amount, numericality: { greater_than: 0 }, presence: true
  validate :amount_canot_be_less_than_perk
  validate :verify_stock_perk

  def amount_canot_be_less_than_perk
    errors.add(:perk, :amount_error) if perk.present? && amount.present? && perk.amount > amount
  end

  def verify_stock_perk
    errors.add(:perk, :quantity) if perk.present? && perk.maximum <= 0
  end

  def after_create
    perk.update_attributes!(maximum: (perk.maximum - 1)) if perk.present?
  end
end
