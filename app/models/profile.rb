class Profile < ActiveRecord::Base
  belongs_to :organisation

  validates_presence_of :organisation

  has_attached_file :logo, 
    storage: :s3,
    s3_credentials: "#{Rails.root}/config/aws.yml",
    path: ":class/:attachment/:id/:style/:filename",
    url: ':s3_domain_url'
end
