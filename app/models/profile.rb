class Profile < ActiveRecord::Base
  belongs_to :organisation

  validates_presence_of :organisation

  has_attached_file :logo, 
    storage: :s3,
    s3_credentials: "#{Rails.root}/config/aws.yml",
    path: ":class/:attachment/:id/:style/:filename",
    url: ':s3_domain_url',
    styles: { 
      :original => '1920×1080>',
      :thumbnail => '100×100>' 
    },
    convert_options: { 
      :original => "-strip",
      :thumbnail => "-quality 75 -strip -background transparent -gravity center -extent 100x100"
    }

  # Validate content type
  validates_attachment_content_type :logo, :content_type => /\Aimage/
end
