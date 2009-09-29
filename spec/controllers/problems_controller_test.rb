require File.dirname(__FILE__) + '/../spec_helper'
 
describe ProblemsController do
  integrate_views

  before :each do
    @problem = Factory.create(:problem)  
  end

  describe "not Authenticated" do 
   
    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end

    it "index action should return problems sorted first by source and after by code" do
      Problem.delete_all

      expected = []
      problem2 = Factory.create(:problem, :source => 'B', :code => 'D')
      problem1 =Factory.create(:problem, :source => 'A', :code => 'A')
      expected << problem1
      expected << problem2

      get :index

      assigns[:problems].should eql(expected)
    end
  
    it "show action should render show template" do
      get :show, :id => @problem.code
      response.should render_template(:show)
    end

  end
 
  describe "Authenticated " do

    before(:each) do 
      execute_login
    end  
  
    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end
  
    it "create action should render new template when model is invalid" do
      @problem = Problem.new
      @problem.stub!(:valid?).and_return(false)
      Problem.stub!(:new).and_return(@problem)
      lambda {
        post :create, :problem => {}      
        }.should change(Problem, :count).by(0)
    end
  
    it "create action should redirect when model is valid" do
      @problem = Problem.new
      @problem.stub!(:valid?).and_return(true)
      @problem.stub!(:code).and_return('TEST')
      Problem.stub!(:new).and_return(@problem)
      lambda {
        post :create, :problem => {}      
      }.should change(Problem, :count).by(1)
    end
  
    it "edit action should render edit template" do
      get :edit, :id => Problem.first.code
      response.should render_template(:edit)
    end
  
    it "update action should redirect when model is valid" do
      put :update, :id => Problem.first.code, :problem => {}
      response.should redirect_to(edit_problem_url(assigns[:problem]))
    end
  
    it "destroy action should destroy model and redirect to index action" do
      pending
      lambda {
        delete :destroy, :id => Problem.first.code
      }.should change(Problem, :count).by(-1)
      response.should redirect_to(problems_url)
    end
  end
end
