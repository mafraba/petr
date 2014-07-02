class AddLogoFilePathToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :logo_file_path, :string
  end
end
