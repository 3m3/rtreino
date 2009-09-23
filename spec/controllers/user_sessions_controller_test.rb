require File.dirname(__FILE__) + '/../spec_helper'
 
describe UserSessionsController do
  integrate_views
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    user_session = UserSession.new
    user_session.stub!(:valid?).and_return(false)
    UserSession.stub!(:new).and_return(user_session)
    post :create, :user_session => {}      
    pending
  end
  
  it "create action should redirect to root url when model is valid" do
    activate_authlogic
    user_session = Factory(:user)
    user_session.stub!(:valid?).and_return(true)
    UserSession.stub!(:new).and_return(user_session)
    post :create, :user_session => {}      
    response.should redirect_to(root_url)
  end  

end
