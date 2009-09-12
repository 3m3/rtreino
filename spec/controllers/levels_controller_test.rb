require File.dirname(__FILE__) + '/../spec_helper'
 
describe LevelsController do
  fixtures :all

  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Level.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @level = Level.new
    @level.stub!(:valid?).and_return(false)
    Level.stub!(:new).and_return(@level)
    lambda {
      post :create, :level => {}      
    }.should change(Level, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @level = Level.new
    @level.stub!(:valid?).and_return(true)
    Level.stub!(:new).and_return(@level)
    lambda {
      post :create, :level => {}      
    }.should change(Level, :count).by(1)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Level.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => Level.first, :level => {}
    response.should redirect_to(level_url(assigns[:level]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    lambda {
      delete :destroy, :id => Level.first
    }.should change(Level, :count).by(-1)
    response.should redirect_to(levels_url)
  end
end
