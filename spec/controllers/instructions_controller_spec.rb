require 'spec_helper'

describe InstructionsController do
  def valid_attributes
    {
      content: "bake for one hour",
      recipe_id: 1
    }
  end

  # describe "GET index" do
  #   it "assigns all instructions as @instructions" do
  #     instruction = Instruction.create! valid_attributes
  #     get :index
  #     assigns(:instructions).should include(instruction)
  #   end
  # end

  describe "GET show" do
    it "assigns the requested instruction as @instruction" do
      instruction = Instruction.create! valid_attributes
      get :show, :id => instruction.id.to_s
      assigns(:instruction).should eq(instruction)
    end
  end

  describe "GET new" do
    it "assigns a new instruction as @instruction" do
      get :new
      assigns(:instruction).should be_a_new(Instruction)
    end
  end

  # describe "GET edit" do
  #   it "assigns the requested instruction as @instruction" do
  #     instruction = Instruction.create! valid_attributes
  #     get :edit, :id => instruction.id.to_s
  #     assigns(:instruction).should eq(instruction)
  #   end
  # end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Instruction" do
        expect {
          post :create, :instruction => valid_attributes
        }.to change(Instruction, :count).by(1)
      end

      it "assigns a newly created instruction as @instruction" do
        post :create, :instruction => valid_attributes
        assigns(:instruction).should be_a(Instruction)
        assigns(:instruction).should be_persisted
      end

      it "redirects to the instruction's recipe" do
        post :create, :instruction => valid_attributes
        response.should redirect_to(Recipe.find(Instruction.last.recipe_id))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved instruction as @instruction" do
        # Trigger the behavior that occurs when invalid params are submitted
        Instruction.any_instance.stub(:save).and_return(false)
        post :create, :instruction => {}
        assigns(:instruction).should be_a_new(Instruction)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Instruction.any_instance.stub(:save).and_return(false)
        post :create, :instruction => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      # it "updates the requested instruction" do
      #   instruction = Instruction.create! valid_attributes
      #   # Assuming there are no other instructions in the database, this
      #   # specifies that the Instruction created on the previous line
      #   # receives the :update_attributes message with whatever params are
      #   # submitted in the request.
      #   Instruction.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
      #   put :update, :id => instruction.id, :instruction => {'these' => 'params'}
      # end

      # it "assigns the requested instruction as @instruction" do
      #   instruction = Instruction.create! valid_attributes
      #   put :update, :id => instruction.id, :instruction => valid_attributes
      #   assigns(:instruction).should eq(instruction)
      # end

      it "redirects to the instruction" do
        instruction = Instruction.create! valid_attributes
        put :update, :id => instruction.id, :instruction => valid_attributes
        response.should redirect_to(instruction)
      end
    end

    describe "with invalid params" do
      # it "assigns the instruction as @instruction" do
      #   instruction = Instruction.create! valid_attributes
      #   # Trigger the behavior that occurs when invalid params are submitted
      #   Instruction.any_instance.stub(:save).and_return(false)
      #   put :update, :id => instruction.id.to_s, :instruction => {}
      #   assigns(:instruction).should eq(instruction)
      # end

      # it "re-renders the 'edit' template" do
      #   instruction = Instruction.create! valid_attributes
      #   # Trigger the behavior that occurs when invalid params are submitted
      #   Instruction.any_instance.stub(:save).and_return(false)
      #   put :update, :id => instruction.id.to_s, :instruction => {}
      #   response.should render_template("edit")
      # end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested instruction" do
      instruction = Instruction.create! valid_attributes
      expect {
        delete :destroy, :id => instruction.id.to_s
      }.to change(Instruction, :count).by(-1)
    end

    it "redirects to the instruction's recipe" do
      instruction = Instruction.create! valid_attributes
      delete :destroy, :id => instruction.id.to_s
      response.should redirect_to(Recipe.find(instruction.recipe_id))
    end
  end
end
