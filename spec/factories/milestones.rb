# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :milestone do
    name "MyString"
    description "MyText"
    done_date "2014-04-23"
    goal_percentage 1.5
    campaign ""
    approved false
  end
end
