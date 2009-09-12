require File.dirname(__FILE__) + '/../spec_helper'
 
describe LanguagesController do
  fixtures :all

  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Language.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @language = Language.new
    @language.stub!(:valid?).and_return(false)
    Language.stub!(:new).and_return(@language)
    lambda {
      post :create, :language => {}      
    }.should change(Language, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @language = Language.new
    @language.stub!(:valid?).and_return(true)
    Language.stub!(:new).and_return(@language)
    lambda {
      post :create, :language => {}      
    }.should change(Language, :count).by(1)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Language.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => Language.first, :language => {}
    response.should redirect_to(language_url(assigns[:language]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    lambda {
      delete :destroy, :id => Language.first
    }.should change(Language, :count).by(-1)
    response.should redirect_to(languages_url)
  end
end
