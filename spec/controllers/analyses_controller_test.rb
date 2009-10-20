require File.dirname(__FILE__) + '/../spec_helper'
 
describe AnalysesController do
  integrate_views

  describe "Authenticated" do
    before(:each) do
      execute_login
      @analysis = Factory.create(:analysis, :creator => @user)
      @problem = @analysis.problem
    end

    def myget(action, things={})
      things[:problem_id] = @problem.code
      get action, things
    end 

    def mypost(action, things={})
      things[:problem_id] = @problem.code
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

    it "create action should redirect analysis page when model is valid and I pressed create button" do
      @analysis = Analysis.new
      @analysis.stub!(:valid?).and_return(true)
      Analysis.stub!(:new).and_return(@analysis)
      lambda {
        mypost :create, :analysis => {}      
      }.should change(Analysis, :count).by(1)
      response.should redirect_to(problem_analysis_path(@problem, @analysis))
    end

    it "edit action should render edit template when the user is editing his stuff" do
      myget :edit, :id => @analysis
      response.should render_template(:edit)
    end

    it "update action should redirect problem analysis page when model is valid and I pressed update button" do
      put :update, :id => Analysis.first, :analysis => {}, :commit => 'Update', :problem_id => @problem.code
      response.should redirect_to(problem_analysis_url(@problem, @analysis))
    end

    it "update action should redirect problem analysis page when model is valid and I pressed update and continue button" do
      put :update, :id => Analysis.first, :analysis => {}, :commit => 'Update and continue', :problem_id => @problem.code
      response.should redirect_to(edit_problem_analysis_url(@problem, @analysis))
    end


    it "destroy action should destroy model and redirect to index action" do
      pending
      lambda {
        delete :destroy, :id => Analysis.first, :problem_id => @problem.code
      }.should change(Analysis, :count).by(-1)
      response.should redirect_to(analyses_url)
    end
  end

end
