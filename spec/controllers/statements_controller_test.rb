require File.dirname(__FILE__) + '/../spec_helper'
 
describe StatementsController do
  fixtures :all

  integrate_views

  before(:each) do 
    activate_authlogic
    UserSession.create User.first
    @problem = Problem.first
  end  

  def myget(action, things={})
    things[:problem_id] = @problem.id
    get action, things
  end 
  
  def mypost(action, things={})
    things[:problem_id] = @problem.id
    post action, things 
  end
  
  it "index action should render index template" do
    pending
    myget :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    myget :show, :id => Statement.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    myget :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @statement = Statement.new
    @statement.stub!(:valid?).and_return(false)
    Statement.stub!(:new).and_return(@statement)
    lambda {
      mypost :create, :statement => {}      
    }.should change(Statement, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @statement = Statement.new
    @statement.stub!(:valid?).and_return(true)
    Statement.stub!(:new).and_return(@statement)
    lambda {
      mypost :create, :statement => {}      
    }.should change(Statement, :count).by(1)
  end
  
  it "edit action should render edit template" do
    myget :edit, :id => Statement.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => Statement.first, :statement => {}, :problem_id => @problem.id
    response.should redirect_to(edit_problem_url(@problem))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    pending
    lambda {
      delete :destroy, :id => Statement.first, :problem_id => @problem.id
    }.should change(Statement, :count).by(-1)
    response.should redirect_to(statements_url)
  end
end
