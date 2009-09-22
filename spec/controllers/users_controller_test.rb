require File.dirname(__FILE__) + '/../spec_helper'
 
describe UsersController do
  fixtures :all

  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
    
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @user = User.new
    @user.stub!(:valid?).and_return(false)
    User.stub!(:new).and_return(@user)
    lambda {
      post :create, :user => {}      
    }.should change(User, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @user = User.new
    @user.stub!(:valid?).and_return(true)
    User.stub!(:new).and_return(@user)
    lambda {
      post :create, :user => {}      
    }.should change(User, :count).by(1)
  end
  
  describe "Authenticated" do
    before(:each) do 
      activate_authlogic
      UserSession.create User.first
    end  

    it "show action should render show template" do
      get :show, :id => User.first
      response.should render_template(:show)
    end


    it "edit action should render edit template" do
      get :edit, :id => User.first
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      put :update, :id => User.first, :user => {}
      response.should redirect_to(root_url)
    end

    it "destroy action should destroy model and redirect to index action" do
      pending
      lambda {
        delete :destroy, :id => User.first
      }.should change(User, :count).by(-1)
      response.should redirect_to(users_url)
    end
  end
end
