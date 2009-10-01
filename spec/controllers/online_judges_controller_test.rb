require File.dirname(__FILE__) + '/../spec_helper'
 
describe OnlineJudgesController do
  before(:each) do
    @online_judge = Factory.create(:online_judge)
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @online_judge
    response.should render_template(:show)
  end

  describe "Authenticated" do
    integrate_views

    before(:each) do
      execute_login      
    end

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end

    it "create action should render new template when model is invalid" do
      @online_judge = OnlineJudge.new
      @online_judge.stub!(:valid?).and_return(false)
      OnlineJudge.stub!(:new).and_return(@online_judge)
      lambda {
        post :create, :online_judge => {}      
      }.should change(OnlineJudge, :count).by(0)
    end

    it "create action should redirect when model is valid" do
      @online_judge = OnlineJudge.new
      @online_judge.stub!(:valid?).and_return(true)
      OnlineJudge.stub!(:new).and_return(@online_judge)
      lambda {
        post :create, :online_judge => {}      
      }.should change(OnlineJudge, :count).by(1)
    end

    it "edit action should render edit template" do
      get :edit, :id => @online_judge
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      put :update, :id => @online_judge, :online_judge => {}
      response.should redirect_to(online_judge_url(assigns[:online_judge]))
    end

    it "destroy action should destroy model and redirect to index action" do
      lambda {
        delete :destroy, :id => @online_judge
      }.should change(OnlineJudge, :count).by(-1)
      response.should redirect_to(online_judges_url)
    end
  end  

  describe "not Authenticated" do
    integrate_views

    it "new action should not render new template" do
      get :new
      response.should redirect_to(login_path)
    end

    it "create action should not render new template when model is invalid" do
      @online_judge = OnlineJudge.new
      @online_judge.stub!(:valid?).and_return(false)
      OnlineJudge.stub!(:new).and_return(@online_judge)
      lambda {
        post :create, :online_judge => {}      
      }.should change(OnlineJudge, :count).by(0)
      response.should redirect_to(login_path)
    end

    it "create action should not redirect when model is valid" do
      @online_judge = OnlineJudge.new
      @online_judge.stub!(:valid?).and_return(true)
      OnlineJudge.stub!(:new).and_return(@online_judge)
      lambda {
        post :create, :online_judge => {}      
      }.should change(OnlineJudge, :count).by(0)
      response.should redirect_to(login_path)
    end

    it "edit action should not render edit template" do
      get :edit, :id => @online_judge
      response.should redirect_to(login_path)
    end

    it "update action should not redirect when model is valid" do
      put :update, :id => @online_judge, :online_judge => {}
      response.should redirect_to(login_path)
    end

    it "destroy action should not destroy model and redirect to index action" do
      lambda {
        delete :destroy, :id => @online_judge
      }.should change(OnlineJudge, :count).by(0)
      response.should redirect_to(login_path)
    end
  end  


end
