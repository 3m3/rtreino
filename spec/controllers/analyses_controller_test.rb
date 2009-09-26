require File.dirname(__FILE__) + '/../spec_helper'
 
describe AnalysesController do
  integrate_views

  describe "Authenticated" do
    before(:each) do
      execute_login
      @analysis = Factory.create(:analysis, :user => @user)
      @problem = @analysis.problem
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
      get :index
      response.should render_template(:index)
    end

    it "show action should render show template" do
      myget :show, :id => @analysis.id
      response.should render_template(:show)
    end

    it "new action should render new template" do
      myget :new
      response.should render_template(:new)
    end

    it "create action should render new template when model is invalid" do
      @analysis = Analysis.new
      @analysis.stub!(:valid?).and_return(false)
      Analysis.stub!(:new).and_return(@analysis)
      lambda {
        mypost :create, :analysis => {}
      }.should change(Analysis, :count).by(0)
    end

    it "create action should redirect when model is valid" do
      @analysis = Analysis.new
      @analysis.stub!(:valid?).and_return(true)
      Analysis.stub!(:new).and_return(@analysis)
      lambda {
        mypost :create, :analysis => {}      
      }.should change(Analysis, :count).by(1)
    end

    it "edit action should render edit template when the user is editing his stuff" do
      myget :edit, :id => @analysis
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      put :update, :id => Analysis.first, :analysis => {}, :problem_id => @problem.id
      response.should redirect_to(edit_problem_url(@problem))
    end

    it "destroy action should destroy model and redirect to index action" do
      pending
      lambda {
        delete :destroy, :id => Analysis.first, :problem_id => @problem.id
      }.should change(Analysis, :count).by(-1)
      response.should redirect_to(analyses_url)
    end
  end

end
