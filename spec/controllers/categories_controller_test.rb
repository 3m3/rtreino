require File.dirname(__FILE__) + '/../spec_helper'
 
describe CategoriesController do
  fixtures :all

  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Category.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @category = Category.new
    @category.stub!(:valid?).and_return(false)
    Category.stub!(:new).and_return(@category)
    lambda {
      post :create, :category => {}      
    }.should change(Category, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @category = Category.new
    @category.stub!(:valid?).and_return(true)
    Category.stub!(:new).and_return(@category)
    lambda {
      post :create, :category => {}      
    }.should change(Category, :count).by(1)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Category.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => Category.first, :category => {}
    response.should redirect_to(category_url(assigns[:category]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    lambda {
      delete :destroy, :id => Category.first
    }.should change(Category, :count).by(-1)
    response.should redirect_to(categories_url)
  end
end
