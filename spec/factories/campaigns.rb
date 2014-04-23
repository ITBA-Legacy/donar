# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    name "MyString"
    description "MyText"
    goal ""
    deadline "2014-04-23 15:27:33"
    minimum ""
    category "MyString"
    locality "MyString"
    organization nil
    short_description "MyText"
  end
end
