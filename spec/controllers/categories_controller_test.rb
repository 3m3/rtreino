require File.dirname(__FILE__) + '/../spec_helper'
 
describe CategoriesController do

  integrate_views

  describe "Logged" do

    before(:each) do
      execute_login
      @category = Factory.create(:category)
    end

    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end

    it "show action should render show template" do
      get :show, :id => @category
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
      category = Category.new
      category.stub!(:valid?).and_return(true)
      Category.stub!(:new).and_return(category)
      lambda {
        post :create, :category => {}      
      }.should change(Category, :count).by(1)
      response.should redirect_to(edit_category_url(assigns[:category]))
    end

    it "edit action should render edit template" do
      get :edit, :id => @category
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      put :update, :id => @category, :category => {}
      response.should redirect_to(edit_category_url(assigns[:category]))
    end

    it "destroy action should destroy model and redirect to index action" do
      lambda {
        delete :destroy, :id => @category
      }.should change(Category, :count).by(-1)
      response.should redirect_to(categories_url)
    end

  end 

  describe "not Logged must redirect to login page when required" do

    before(:each) do
      @category = Factory.create(:category)
    end

    it "index action" do
      get :index
      response.should redirect_to(login_url)
    end

    it "show action" do
      get :show, :id => @category
      response.should redirect_to(login_url)
    end

    it "new action" do
      get :new
      response.should redirect_to(login_url)
    end

    it "create action with invalid params" do
      @category = Category.new
      @category.stub!(:valid?).and_return(false)
      Category.stub!(:new).and_return(@category)
      lambda {
        post :create, :category => {}      
      }.should_not change(Category, :count)
      response.should redirect_to(login_url)
    end

    it "create action with valid params" do
      category = Category.new
      category.stub!(:valid?).and_return(true)
      Category.stub!(:new).and_return(category)
      lambda {
        post :create, :category => {}      
      }.should_not change(Category, :count)
      response.should redirect_to(login_url)
    end

    it "edit action" do
      get :edit, :id => @category
      response.should redirect_to(login_url)
    end

    it "update action" do
      put :update, :id => @category, :category => {}
      response.should redirect_to(login_url)
    end

    it "destroy action" do
      lambda {
        delete :destroy, :id => @category
      }.should_not change(Category, :count)
      response.should redirect_to(login_url)
    end

  end 

end
