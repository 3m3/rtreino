require File.dirname(__FILE__) + '/../spec_helper'
 
describe CommentsController do
  fixtures :all

  before(:each) do
    activate_authlogic
    UserSession.create User.first
    @problem = Problem.first
  end

  integrate_views
  
  it "index action should render index template" do
    pending
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    pending
    get :show, :id => Comment.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @comment = Comment.new
    @comment.stub!(:valid?).and_return(false)
    Comment.stub!(:new).and_return(@comment)
    lambda {
      post :create, :comment => {}      
    }.should change(Comment, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @comment = Comment.new
    @comment.stub!(:valid?).and_return(true)
    Comment.stub!(:new).and_return(@comment)
    lambda {
      post :create, :comment => {}      
    }.should change(Comment, :count).by(1)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Comment.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => Comment.first, :comment => {}
    response.should redirect_to(comment_url(assigns[:comment]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    lambda {
      delete :destroy, :id => Comment.first
    }.should change(Comment, :count).by(-1)
    response.should redirect_to(comments_url)
  end
end
