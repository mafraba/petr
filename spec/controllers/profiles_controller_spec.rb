require 'spec_helper'

describe ProfilesController do

  describe "GET 'edit'" do
    it "assigns the requested profile as @profile" do
      profile = FactoryGirl.create(:profile)
      get :edit, {:id => profile.to_param}
      assigns(:profile).should eq(profile)
    end
  end

end
