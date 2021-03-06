require File.dirname(__FILE__) + '/../spec_helper'
 
describe StatementsController do
  integrate_views

  def myget(action, things={})
    things[:problem_id] = @problem.code
    get action, things
  end 

  def mypost(action, things={})
    things[:problem_id] = @problem.code
    post action, things 
  end
 
  describe "not Authenticated" do 
    before(:each) do 
      @statement = Factory.create(:statement)
      @problem = @statement.problem
    end  

    it "index action should redirect to login page" do
      pending
      myget :index
      response.should redirect_to(login_path)
    end

    it "show action should redirect to login page" do
      myget :show, :id => @statement.id
      response.should redirect_to(login_path)
    end

    it "new action should redirect to login page" do
      myget :new
      response.should redirect_to(login_path)
    end

    it "create action should redirect to login page" do
      @statement = Statement.new
      @statement.stub!(:valid?).and_return(false)
      Statement.stub!(:new).and_return(@statement)
      lambda {
        mypost :create, :statement => {}      
      }.should change(Statement, :count).by(0)
      response.should redirect_to(login_path)
    end

    it "create action should redirect to login page" do
      @statement = Statement.new
      @statement.stub!(:valid?).and_return(true)
      Statement.stub!(:new).and_return(@statement)
      lambda {
        mypost :create, :statement => {}      
      }.should change(Statement, :count).by(0)
      response.should redirect_to(login_path)
    end

    it "edit action should redirect to login page" do
      myget :edit, :id => @statement
      response.should redirect_to(login_path)
    end

    it "update action should redirect to login page" do
      put :update, :id => @statement, :statement => {}, :problem_id => @problem.code
      response.should redirect_to(login_path)
    end

    it "destroy action should redirect to login page" do
      pending
      lambda {
        delete :destroy, :id => @statement, :problem_id => @problem.code
      }.should change(Statement, :count).by(0)
      response.should redirect_to(login_path)
    end
  end

  describe "Authenticated" do 
    before(:each) do 
      execute_login
      @statement = Factory.create(:statement, :creator => @user)
      @problem = @statement.problem
    end  

   it "index action should render index template" do
      pending
      myget :index
      response.should render_template(:index)
    end

    it "show action should render show template" do
      myget :show, :id => @statement.id
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

    it "create action should redirect problem page when model is valid and I pressed create button" do
      @statement = Statement.new
      @statement.stub!(:valid?).and_return(true)
      Statement.stub!(:new).and_return(@statement)
      lambda {
        mypost :create, :statement => {}, :commit => "Create"
      }.should change(Statement, :count).by(1)
      response.should redirect_to(problem_path(@statement.problem))
    end

    it "create action should redirect edit problem statement page when model is valid and I pressed create and continue button" do
      @statement = Statement.new
      @statement.stub!(:valid?).and_return(true)
      Statement.stub!(:new).and_return(@statement)
      lambda {
        mypost :create, :statement => {}, :commit => "Create and continue" 
      }.should change(Statement, :count).by(1)
      response.should redirect_to(edit_problem_statement_path(@statement.problem, @statement))
    end

    it "edit action should render edit template" do
      myget :edit, :id => @statement
      response.should render_template(:edit)
    end

    it "update action should redirect problem page when model is valid and I press update button" do
      put :update, :id => @statement, :statement => {}, :commit => 'Update', :problem_id => @problem.code
      response.should redirect_to(problem_url(@problem))
    end

    it "update action should redirect problem page when model is valid and I press update and continue button" do
      put :update, :id => @statement, :statement => {}, :commit => 'Update and continue', :problem_id => @problem.code
      response.should redirect_to(edit_problem_statement_url(@problem, @statement))
    end

    it "destroy action should destroy model and redirect to index action" do
      pending
      lambda {
        delete :destroy, :id => @statement, :problem_id => @problem.code
      }.should change(Statement, :count).by(-1)
      response.should redirect_to(statements_url)
    end
  end

end
