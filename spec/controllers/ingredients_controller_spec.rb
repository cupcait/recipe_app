require 'spec_helper'

describe IngredientsController do
  def valid_attributes
    {
      name: "apples",
      recipe_id: 1
    }
  end

  describe "GET index" do
    it "assigns all ingredients as @ingredients" do
      ingredient = Ingredient.create! valid_attributes
      get :index
      assigns(:ingredients).should include(ingredient)
    end
  end

  describe "GET show" do
    it "assigns the requested ingredient as @ingredient" do
      ingredient = Ingredient.create! valid_attributes
      get :show, :id => ingredient.id.to_s
      assigns(:ingredient).should eq(ingredient)
    end
  end

  describe "GET new" do
    it "assigns a new ingredient as @ingredient" do
      get :new
      assigns(:ingredient).should be_a_new(Ingredient)
    end
  end

  describe "GET edit" do
    it "assigns the requested ingredient as @ingredient" do
      ingredient = Ingredient.create! valid_attributes
      get :edit, :id => ingredient.id.to_s
      assigns(:ingredient).should eq(ingredient)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ingredient" do
        expect {
          post :create, :ingredient => valid_attributes
        }.to change(Ingredient, :count).by(1)
      end

      it "assigns a newly created ingredient as @ingredient" do
        post :create, :ingredient => valid_attributes
        assigns(:ingredient).should be_a(Ingredient)
        assigns(:ingredient).should be_persisted
      end

      it "redirects to the ingredient's recipe" do
        post :create, :ingredient => valid_attributes
        response.should redirect_to(Recipe.find(Ingredient.last.recipe_id))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ingredient as @ingredient" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ingredient.any_instance.stub(:save).and_return(false)
        post :create, :ingredient => {}
        assigns(:ingredient).should be_a_new(Ingredient)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ingredient.any_instance.stub(:save).and_return(false)
        post :create, :ingredient => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested ingredient" do
        ingredient = Ingredient.create! valid_attributes
        # Assuming there are no other ingredients in the database, this
        # specifies that the Ingredient created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Ingredient.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => ingredient.id, :ingredient => {'these' => 'params'}
      end

      it "assigns the requested ingredient as @ingredient" do
        ingredient = Ingredient.create! valid_attributes
        put :update, :id => ingredient.id, :ingredient => valid_attributes
        assigns(:ingredient).should eq(ingredient)
      end

      it "redirects to the ingredient" do
        ingredient = Ingredient.create! valid_attributes
        put :update, :id => ingredient.id, :ingredient => valid_attributes
        response.should redirect_to(ingredient)
      end
    end

    describe "with invalid params" do
      it "assigns the ingredient as @ingredient" do
        ingredient = Ingredient.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Ingredient.any_instance.stub(:save).and_return(false)
        put :update, :id => ingredient.id.to_s, :ingredient => {}
        assigns(:ingredient).should eq(ingredient)
      end

      it "re-renders the 'edit' template" do
        ingredient = Ingredient.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Ingredient.any_instance.stub(:save).and_return(false)
        put :update, :id => ingredient.id.to_s, :ingredient => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ingredient" do
      ingredient = Ingredient.create! valid_attributes
      expect {
        delete :destroy, :id => ingredient.id.to_s
      }.to change(Ingredient, :count).by(-1)
    end

    it "redirects to the ingredient's recipe" do
      ingredient = Ingredient.create! valid_attributes
      delete :destroy, :id => ingredient.id.to_s
      response.should redirect_to(Recipe.find(ingredient.recipe_id))
    end
  end
end
