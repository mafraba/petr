class Animal < ActiveRecord::Base

  # Should always belong to an organisation
  validates_presence_of :organisation
  belongs_to :organisation
  # Should always have a name
  validates_presence_of :name
  # Should always have a sex
  validates_presence_of :sex
  # Should always have a birth date
  validates_presence_of :birthdate
  # Should always have a description
  validates_presence_of :description

  # Sex should be either 'male' or 'female'
  validates :sex, inclusion: { in: %w(male female) }
end
