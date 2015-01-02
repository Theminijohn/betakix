# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "MyString"
    kind "MyString"
    poll nil
  end
end
