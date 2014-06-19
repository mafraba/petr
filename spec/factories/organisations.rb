# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organisation do	
  	email 			"test@man.org"
  	password		"X1234567"
  	confirmed_at	"2011-01-01"
  end

  factory :another_organisation, class: Organisation do	
  	email 			"test2@man.org"
  	password		"X1234567"
  	confirmed_at	"2011-01-01"
  end
end
