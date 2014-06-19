require 'spec_helper'

describe ProfilesController do

  describe "GET edit" do
    it "works for the organisation the profile belongs_to" do
      # Simulate a login
      organisation = FactoryGirl.create(:organisation)
      sign_in organisation
      profile = organisation.profile
      get :edit, {:id => profile.to_param}
      assigns(:profile).should eq(profile)
    end

    it "not allowed for other organisations" do
      # Simulate a login
      organisation = FactoryGirl.create(:organisation)
      sign_in organisation
      another_organisation = FactoryGirl.create(:another_organisation)
      profile = another_organisation.profile
      # Try to edit another organisation's profile
      get :edit, {:id => profile.to_param}
      # Should redirect to home page
      response.should redirect_to(root_path)
    end

    it "not allowed for individuals (not logged in)" do
      # Simulate a login
      organisation = FactoryGirl.create(:organisation)
      profile = organisation.profile
      # Try to edit another organisation's profile
      get :edit, {:id => profile.to_param}
      # Should redirect to home page
      response.should redirect_to(root_path)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates my own profile" do
        # Simulate a login
        organisation = FactoryGirl.create(:organisation)
        sign_in organisation
        # The profile created on the previous line (associated to an organisation)
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Profile.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => organisation.profile.to_param, :profile => { "name" => "MyString" }}
      end

      it "doesn't update another's profile" do
        # Simulate a login
        organisation = FactoryGirl.create(:organisation)
        sign_in organisation
        # Should not receive the :update_attributes message
        Profile.any_instance.should_not_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => FactoryGirl.create(:another_profile).to_param, :profile => { "name" => "MyString" }}
      end

      it "assigns the requested profile as @profile" do
        profile = FactoryGirl.create(:profile)
        put :update, {:id => profile.to_param, :profile => FactoryGirl.attributes_for(:profile)}
        assigns(:profile).should eq(profile)
      end

      it "redirects to the profile" do
        # Simulate a login
        organisation = FactoryGirl.create(:organisation)
        sign_in organisation
        put :update, {:id => organisation.profile.to_param, :profile => FactoryGirl.attributes_for(:profile)}
        response.should redirect_to(organisation.profile)
      end

    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        # Simulate a login
        organisation = FactoryGirl.create(:organisation)
        sign_in organisation
        profile = organisation.profile
        # Trigger the behavior that occurs when invalid params are submitted
        Profile.any_instance.stub(:save).and_return(false)
        put :update, {:id => profile.to_param, :profile => { "name" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

end
