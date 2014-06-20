# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :animal do
    name "MyAnimal"
    sex "male"
    birthdate "2014-06-09"
    description "MyText"
    organisation
  end

  factory :another_animal, class: Animal do
    name "AnotherAnimal"
    sex "male"
    birthdate "2011-06-09"
    description "AnotherText"
    association :organisation, factory: :another_organisation
  end
end
