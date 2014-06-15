class Profile < ActiveRecord::Base
  belongs_to :organisation

  validates_presence_of :organisation
end
