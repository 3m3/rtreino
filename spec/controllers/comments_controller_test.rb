require File.dirname(__FILE__) + '/../spec_helper'

describe CommentsController do

  before(:each) do
    execute_login
  end

  integrate_views
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end


  describe "Analysis" do

    before(:each) do
      @comment = Factory.create(:comment_from_analysis, :creator => @user)
      @analysis = @comment.commentable
    end

    it "index action should render index template" do
      pending
      get :index
      response.should render_template(:index)
    end

    it "show action should render show template" do
      pending
      get :show, :id => Comment.first
      response.should render_template(:show)
    end

    it "create action should render new template when model is invalid" do
      comment = Comment.new
      comment.stub!(:valid?).and_return(false)
      Comment.stub!(:new).and_return(comment)
      lambda {
        post :create, :comment => {}      
      }.should change(Comment, :count).by(0)
    end

    it "create action should redirect when model is valid" do
      comment = Comment.new
      comment.stub!(:valid?).and_return(true)
      comment.stub!(:commentable_id).and_return(@analysis.id)
      comment.stub!(:commentable_type).and_return('Analysis')
      comment.stub!(:commentable).and_return(@analysis)
      Comment.stub!(:new).and_return(comment)
      lambda {
        post :create, :comment => {}      
      }.should change(Comment, :count).by(1)
      response.should redirect_to(problem_analysis_path(comment.commentable.problem, comment.commentable))
    end

    it "edit action should render edit template" do
      get :edit, :id => @comment.id
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      put :update, :id => @comment, :comment => {}
      response.should redirect_to(problem_analysis_path(@comment.commentable.problem, @comment.commentable))
    end
  end

  describe "Comment" do

    before(:each) do
      @comment = Factory.create(:comment_from_comment, :creator => @user)
      @comment_parent = @comment.commentable
      @analysis = @comment_parent.commentable
    end

    it "create action should render new template when model is invalid" do
      comment = Comment.new
      comment.stub!(:valid?).and_return(false)
      Comment.stub!(:new).and_return(comment)
      lambda {
        post :create, :comment => {}      
      }.should change(Comment, :count).by(0)
    end

    it "create action should redirect when model is valid" do
      comment = Comment.new
      comment.stub!(:valid?).and_return(true)
      comment.stub!(:commentable_id).and_return(@comment_parent.id)
      comment.stub!(:commentable_type).and_return('Comment')
      comment.stub!(:commentable).and_return(@comment_parent)
      Comment.stub!(:new).and_return(comment)
      lambda {
        post :create, :comment => {}      
      }.should change(Comment, :count).by(1)
      response.should redirect_to(problem_analysis_path(@analysis.problem, @analysis))
    end

    it "edit action should render edit template" do
      get :edit, :id => @comment.id
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      put :update, :id => @comment, :comment => {}
      response.should redirect_to(problem_analysis_path(@analysis.problem, @analysis))
    end
  end

end
