Then(/^the animal should be removed from the system$/) do
  expect(Animal.where(name: FactoryGirl.attributes_for(:animal)[:name])).not_to exist
end

When(/^I try to delete an animal/) do
  animal = FactoryGirl.create(:another_animal)
  page.driver.submit :delete, animal_path(animal), {}
end