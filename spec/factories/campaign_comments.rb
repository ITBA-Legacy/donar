# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign_comment do
    user nil
    campaign nil
    message "MyText"
    post_date "2014-04-23 16:33:56"
  end
end
