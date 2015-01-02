# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    reply nil
    question nil
    possible_answer nil
    value "MyString"
  end
end
