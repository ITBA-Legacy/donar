# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :milestone do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    done_date { Time.current }
    goal_percentage 1.5
    approved false
  end
end
