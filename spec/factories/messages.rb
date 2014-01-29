# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    content "This is a fantastic idea!"
    user nil
  end
end
