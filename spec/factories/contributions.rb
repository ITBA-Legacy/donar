# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contribution do
    campaign nil
    campaign_perk nil
    user nil
    amount 1.5
  end
end
