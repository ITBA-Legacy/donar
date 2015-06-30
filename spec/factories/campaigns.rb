# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    goal 200.0
    deadline { Time.current + 1.month }
    minimum 1.0
    locality 'BA'
    country 'ARG'
    short_description { Faker::Lorem.sentence }
    category { FactoryGirl.create(:category) }
  end
end
