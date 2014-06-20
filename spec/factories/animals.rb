# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :animal do
    name "MyAnimal"
    sex "male"
    birthdate "2014-06-09"
    description "MyText"
    organisation
  end
end
