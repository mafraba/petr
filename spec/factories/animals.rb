# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :animal do
    name "MyString"
    sex "MyString"
    birthdate "2014-06-09"
    organisation nil
    description "MyText"
  end
end
