# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign_perk do
    campaign nil
    amount 1.5
    name "MyString"
    maximun 1
    description "MyText"
  end
end
