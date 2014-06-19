# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    organisation
    description "My Profile description"
    name "My organisation's name"
  end

  factory :another_profile, class: Profile do
    association :organisation, factory: :another_organisation
    description "Another's Profile description"
    name "Another organisation's name"
  end

end
