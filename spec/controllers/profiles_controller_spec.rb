require 'spec_helper'

describe ProfilesController do

  describe "GET 'edit'" do
    it "assigns the logged organisation's profile as @profile" do
      org = FactoryGirl.create(:organisation)
      sign_in org
      get :edit
      assigns(:profile).should eq(org.profile)
    end
  end

end
