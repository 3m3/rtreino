require File.dirname(__FILE__) + '/../spec_helper'
 
describe ProblemsController do
  fixtures :all

  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Problem.first
    response.should render_template(:show)
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
    Problem.stub!(:new).and_return(@problem)
    lambda {
      post :create, :problem => {}      
    }.should change(Problem, :count).by(1)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Problem.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => Problem.first, :problem => {}
    response.should redirect_to(problem_url(assigns[:problem]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    lambda {
      delete :destroy, :id => Problem.first
    }.should change(Problem, :count).by(-1)
    response.should redirect_to(problems_url)
  end
end
