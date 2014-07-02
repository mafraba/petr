class RemoveLogoFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :logo, :string
  end
end
