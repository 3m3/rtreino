require File.dirname(__FILE__) + '/../spec_helper'
 
describe StatementsController do
  fixtures :all

  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Statement.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @statement = Statement.new
    @statement.stub!(:valid?).and_return(false)
    Statement.stub!(:new).and_return(@statement)
    lambda {
      post :create, :statement => {}      
    }.should change(Statement, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @statement = Statement.new
    @statement.stub!(:valid?).and_return(true)
    Statement.stub!(:new).and_return(@statement)
    lambda {
      post :create, :statement => {}      
    }.should change(Statement, :count).by(1)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Statement.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => Statement.first, :statement => {}
    response.should redirect_to(statement_url(assigns[:statement]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    lambda {
      delete :destroy, :id => Statement.first
    }.should change(Statement, :count).by(-1)
    response.should redirect_to(statements_url)
  end
end
