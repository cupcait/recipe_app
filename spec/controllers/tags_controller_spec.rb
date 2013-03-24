require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TagsController do

  # This should return the minimal set of attributes required to create a valid
  # Tag. As you add validations to Tag, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {value: "yummy"}
  end

  describe "GET index" do
    it "assigns all tags as @tags" do
      tag = Tag.create! valid_attributes
      get :index
      assigns(:tags).should include(tag)
    end
  end

  describe "GET show" do
    it "assigns the requested tag as @tag" do
      tag = Tag.create! valid_attributes
      get :show, :id => tag.id.to_s
      assigns(:tag).should eq(tag)
    end
  end

  describe "GET new" do
    it "assigns a new tag as @tag" do
      get :new
      assigns(:tag).should be_a_new(Tag)
    end
  end

  describe "GET edit" do
    it "assigns the requested tag as @tag" do
      tag = Tag.create! valid_attributes
      get :edit, :id => tag.id.to_s
      assigns(:tag).should eq(tag)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Tag" do
        expect {
          post :create, :tag => valid_attributes
        }.to change(Tag, :count).by(1)
      end

      it "assigns a newly created tag as @tag" do
        post :create, :tag => valid_attributes
        assigns(:tag).should be_a(Tag)
        assigns(:tag).should be_persisted
      end

      it "redirects to the created tag" do
        post :create, :tag => valid_attributes
        response.should redirect_to(Tag.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tag as @tag" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tag.any_instance.stub(:save).and_return(false)
        post :create, :tag => {}
        assigns(:tag).should be_a_new(Tag)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tag.any_instance.stub(:save).and_return(false)
        post :create, :tag => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tag" do
        tag = Tag.create! valid_attributes
        # Assuming there are no other tags in the database, this
        # specifies that the Tag created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Tag.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => tag.id, :tag => {'these' => 'params'}
      end

      it "assigns the requested tag as @tag" do
        tag = Tag.create! valid_attributes
        put :update, :id => tag.id, :tag => valid_attributes
        assigns(:tag).should eq(tag)
      end

      it "redirects to the tag" do
        tag = Tag.create! valid_attributes
        put :update, :id => tag.id, :tag => valid_attributes
        response.should redirect_to(tag)
      end
    end

    describe "with invalid params" do
      it "assigns the tag as @tag" do
        tag = Tag.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tag.any_instance.stub(:save).and_return(false)
        put :update, :id => tag.id.to_s, :tag => {}
        assigns(:tag).should eq(tag)
      end

      it "re-renders the 'edit' template" do
        tag = Tag.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tag.any_instance.stub(:save).and_return(false)
        put :update, :id => tag.id.to_s, :tag => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tag" do
      tag = Tag.create! valid_attributes
      expect {
        delete :destroy, :id => tag.id.to_s
      }.to change(Tag, :count).by(-1)
    end

    it "redirects to the tags list" do
      tag = Tag.create! valid_attributes
      delete :destroy, :id => tag.id.to_s
      response.should redirect_to(tags_url)
    end
  end

end
