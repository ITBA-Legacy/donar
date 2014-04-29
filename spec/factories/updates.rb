# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :update do
    user nil
    campaign nil
    message "MyText"
  end
end
