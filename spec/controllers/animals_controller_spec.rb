require 'spec_helper'


describe AnimalsController do

  # This should return the minimal set of attributes required to create a valid
  # Animal. As you add validations to Animal, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes)  { FactoryGirl.attributes_for(:animal) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnimalsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all animals as @animals" do
      animal = FactoryGirl.create(:animal)
      get :index, {}, valid_session
      assigns(:animals).should eq([animal])
    end
  end

  describe "GET show" do
    it "assigns the requested animal as @animal" do
      animal = FactoryGirl.create(:animal)
      get :show, {:id => animal.to_param}, valid_session
      assigns(:animal).should eq(animal)
    end
  end

  describe "GET new" do
    it "assigns a new animal as @animal" do
      get :new, {}, valid_session
      assigns(:animal).should be_a_new(Animal)
    end
  end

  describe "GET edit" do
    it "assigns the requested animal as @animal" do
      animal = FactoryGirl.create(:animal)
      get :edit, {:id => animal.to_param}, valid_session
      assigns(:animal).should eq(animal)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Animal" do
        sign_in FactoryGirl.create(:organisation)
        expect {
          post :create, {:animal => valid_attributes}, valid_session
        }.to change(Animal, :count).by(1)
      end

      it "assigns a newly created animal as @animal" do
        sign_in FactoryGirl.create(:organisation)
        post :create, {:animal => valid_attributes}, valid_session
        assigns(:animal).should be_a(Animal)
        assigns(:animal).should be_persisted
      end

      it "redirects to the created animal" do
        sign_in FactoryGirl.create(:organisation)
        post :create, {:animal => valid_attributes}, valid_session
        response.should redirect_to(Animal.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved animal as @animal" do
        # Trigger the behavior that occurs when invalid params are submitted
        Animal.any_instance.stub(:save).and_return(false)
        post :create, {:animal => { "name" => "invalid value" }}, valid_session
        assigns(:animal).should be_a_new(Animal)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Animal.any_instance.stub(:save).and_return(false)
        post :create, {:animal => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested animal" do
        animal = FactoryGirl.create(:animal)
        sign_in animal.organisation
        # Assuming there are no other animals in the database, this
        # specifies that the Animal created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Animal.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => animal.to_param, :animal => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested animal as @animal" do
        animal = FactoryGirl.create(:animal)
        put :update, {:id => animal.to_param, :animal => valid_attributes}, valid_session
        assigns(:animal).should eq(animal)
      end

      it "redirects to the animal" do
        animal = FactoryGirl.create(:animal)
        sign_in animal.organisation
        put :update, {:id => animal.to_param, :animal => valid_attributes}, valid_session
        response.should redirect_to(animal)
      end
    end

    describe "with invalid params" do
      it "assigns the animal as @animal" do
        animal = FactoryGirl.create(:animal)
        # Trigger the behavior that occurs when invalid params are submitted
        Animal.any_instance.stub(:save).and_return(false)
        put :update, {:id => animal.to_param, :animal => { "name" => "invalid value" }}, valid_session
        assigns(:animal).should eq(animal)
      end

      it "re-renders the 'edit' template" do
        animal = FactoryGirl.create(:animal)
        sign_in animal.organisation
        # Trigger the behavior that occurs when invalid params are submitted
        Animal.any_instance.stub(:save).and_return(false)
        put :update, {:id => animal.to_param, :animal => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested animal if signed in" do
      animal = FactoryGirl.create(:animal)
      sign_in animal.organisation
      expect {
        delete :destroy, {:id => animal.to_param}, valid_session
      }.to change(Animal, :count).by(-1)
    end

    it "does not destroy the requested animal if NOT signed in" do
      animal = FactoryGirl.create(:animal)
      expect {
        delete :destroy, {:id => animal.to_param}, valid_session
      }.not_to change(Animal, :count).by(-1)
    end

    it "redirects to the animals list" do
      animal = FactoryGirl.create(:animal)
      sign_in animal.organisation
      delete :destroy, {:id => animal.to_param}, valid_session
      response.should redirect_to(animals_url)
    end
  end

end
