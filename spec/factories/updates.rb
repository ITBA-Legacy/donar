# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :update do
    message { Faker::Lorem.sentence }
  end
end
