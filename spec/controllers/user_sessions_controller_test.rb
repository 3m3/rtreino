require File.dirname(__FILE__) + '/../spec_helper'
 
describe UserSessionsController do
  fixtures :all

  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => UserSession.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @user_session = UserSession.new
    @user_session.stub!(:valid?).and_return(false)
    UserSession.stub!(:new).and_return(@user_session)
    lambda {
      post :create, :user_session => {}      
    }.should change(UserSession, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @user_session = UserSession.new
    @user_session.stub!(:valid?).and_return(true)
    UserSession.stub!(:new).and_return(@user_session)
    lambda {
      post :create, :user_session => {}      
    }.should change(UserSession, :count).by(1)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => UserSession.first
    response.should render_template(:edit)
  end

  it "edit action without logged should render root_url" do
    get :edit, :id => :current
    response.should render_to(root_url)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => UserSession.first, :user_session => {}
    response.should redirect_to(user_session_url(assigns[:user_session]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    lambda {
      delete :destroy, :id => UserSession.first
    }.should change(UserSession, :count).by(-1)
    response.should redirect_to(user_sessions_url)
  end
end
