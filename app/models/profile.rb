class Profile < ActiveRecord::Base
  belongs_to :organisation

  validates_presence_of :organisation
  validates_presence_of :name
  validates_presence_of :description
end
