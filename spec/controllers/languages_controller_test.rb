require File.dirname(__FILE__) + '/../spec_helper'
 
describe LanguagesController do
  integrate_views

  before :each do 
    @language = Factory.create(:language)
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Language.first
    response.should render_template(:show)
  end

  describe "Authenticated" do 
    before(:each) do
      execute_login
      @language = Factory.create(:language)
    end

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end

    it "create action should render new template when model is invalid" do
      language = Language.new
      language.stub!(:valid?).and_return(false)
      Language.stub!(:new).and_return(language)
      lambda {
        post :create, :language => {}      
      }.should change(Language, :count).by(0)
      response.should redirect_to(languages_path)
    end

    it "create action should redirect when model is valid" do
      language = Language.new
      language.stub!(:valid?).and_return(true)
      Language.stub!(:new).and_return(language)
      lambda {
        post :create, :language => {}      
      }.should change(Language, :count).by(1)
      response.should redirect_to(edit_language_url(assigns[:language]))
    end

    it "edit action should render edit template" do
      get :edit, :id => @language
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      put :update, :id => @language, :language => {}
      response.should redirect_to(edit_language_url(assigns[:language]))
    end

    it "destroy action raise error" do
      pending
    end
  end
  describe "not Authenticated" do 
    before(:each) do
      @language = Factory.create(:language)
    end

    it "new action should redirect to login page" do
      get :new
      response.should redirect_to(login_path)
    end

    it "create action should redirect to login page" do
      language = Language.new
      language.stub!(:valid?).and_return(false)
      Language.stub!(:new).and_return(language)
      lambda {
        post :create, :language => {}      
      }.should change(Language, :count).by(0)
      response.should redirect_to(login_path)
    end

    it "create action should redirect to login page" do
      language = Language.new
      language.stub!(:valid?).and_return(true)
      Language.stub!(:new).and_return(language)
      lambda {
        post :create, :language => {}      
      }.should change(Language, :count).by(0)
      response.should redirect_to(login_path)
    end

    it "edit action should redirect to login page" do
      get :edit, :id => @language
      response.should redirect_to(login_path)
    end

    it "update action should redirect to login page" do
      put :update, :id => @language, :language => {}
      response.should redirect_to(login_path)
    end

  end

end
