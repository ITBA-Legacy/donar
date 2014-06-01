# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    status 'MyString'
    contribution nil
    success_token 'MyString'
    failure_token 'MyString'
    pending_token 'MyString'
  end
end
