require 'spec_helper'

describe ProfilesController do

  describe "GET edit" do
    it "assigns the requested profile as @profile" do
      profile = FactoryGirl.create(:profile)
      get :edit, {:id => profile.to_param}
      assigns(:profile).should eq(profile)
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

      # it "redirects to the profile" do
      #   profile = FactoryGirl.create(:profile)
      #   put :update, {:id => profile.to_param, :profile => valid_attributes}
      #   response.should redirect_to(profile)
      # end

    end

    describe "with invalid params" do
      it "assigns the profile as @profile" do
        profile = FactoryGirl.create(:profile)
        # Trigger the behavior that occurs when invalid params are submitted
        Profile.any_instance.stub(:save).and_return(false)
        put :update, {:id => profile.to_param, :profile => { "name" => "invalid value" }}
        assigns(:profile).should eq(profile)
      end

      it "re-renders the 'edit' template" do
        profile = FactoryGirl.create(:profile)
        # Trigger the behavior that occurs when invalid params are submitted
        Profile.any_instance.stub(:save).and_return(false)
        put :update, {:id => profile.to_param, :profile => { "name" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

end
