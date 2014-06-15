class Organisation < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  
  # Organisations can register animals         
  has_many :animals, dependent: :destroy

  # Organisations have a profile
  has_one :profile, dependent: :destroy

  # Auto generate profile on creation
  after_create :build_profile

  private ###################################################################

  def build_profile
  	profile = Profile.new 
  	profile.organisation = self
  	profile.save
  end
end
