require 'spec_helper'

describe PostsController do

 before :each do
   @post = Factory.create(:post)
 end

  describe "GET index" do
    it "assigns all posts as @posts" do
      get :index
      response.code.should == "200"
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      get :show, :id => @post.id
      assigns(:post).should eq(@post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      get :edit, :id => @post.id
      assigns(:post).should eq(@post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, :post => Factory.attributes_for(:post)
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, :post => Factory.attributes_for(:post)
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, :post => Factory.attributes_for(:post)
        response.should redirect_to(Post.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, :post => {}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, :post => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post" do
        put :update, :id => @post.id, :post => Factory.attributes_for(:post,:name => "test1")
      end

      it "assigns the requested post as @post" do
        put :update, :id => @post.id, :post => Factory.attributes_for(:post,:name => "test1")
        @post.reload
        @post.name.should == "test1"
      end

      it "redirects to the post" do
        put :update, :id => @post.id, :post => Factory.attributes_for(:post,:name => "test1")
        response.should redirect_to(@post)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        Post.any_instance.stub(:save).and_return(false)
        put :update, :id => @post.id, :post => {}
        assigns(:post).should eq(@post)
      end

      it "re-renders the 'edit' template" do
        Post.any_instance.stub(:save).and_return(false)
        put :update, :id => @post.id, :post => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      expect {
        delete :destroy, :id => @post.id
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete :destroy, :id => @post.id
      response.should redirect_to "/posts"
    end
  end

end
