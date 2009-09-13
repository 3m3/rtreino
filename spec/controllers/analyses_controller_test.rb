require File.dirname(__FILE__) + '/../spec_helper'
 
describe AnalysesController do
  fixtures :all

  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Analysis.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @analysis = Analysis.new
    @analysis.stub!(:valid?).and_return(false)
    Analysis.stub!(:new).and_return(@analysis)
    lambda {
      post :create, :analysis => {}      
    }.should change(Analysis, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @analysis = Analysis.new
    @analysis.stub!(:valid?).and_return(true)
    Analysis.stub!(:new).and_return(@analysis)
    lambda {
      post :create, :analysis => {}      
    }.should change(Analysis, :count).by(1)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Analysis.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => Analysis.first, :analysis => {}
    response.should redirect_to(analysis_url(assigns[:analysis]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    lambda {
      delete :destroy, :id => Analysis.first
    }.should change(Analysis, :count).by(-1)
    response.should redirect_to(analyses_url)
  end
end
