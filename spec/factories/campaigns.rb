# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    goal 100
    deadline { Time.current + 1.month }
    minimum 1.5
    category 'health'
    locality { Faker::Address.city }
    short_description { Faker::Lorem.sentence }
  end
end
