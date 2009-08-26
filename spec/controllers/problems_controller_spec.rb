require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProblemsController do

  def mock_problem(stubs={})
    @mock_problem ||= mock_model(Problem, stubs)
  end

  describe "GET index" do
    it "assigns all problems as @problems" do
      Problem.stub!(:find).with(:all).and_return([mock_problem])
      get :index
      assigns[:problems].should == [mock_problem]
    end
  end

  describe "GET show" do
    it "assigns the requested problem as @problem" do
      Problem.stub!(:find).with("37").and_return(mock_problem)
      get :show, :id => "37"
      assigns[:problem].should equal(mock_problem)
    end
  end

  describe "GET new" do
    it "assigns a new problem as @problem" do
      Problem.stub!(:new).and_return(mock_problem)
      get :new
      assigns[:problem].should equal(mock_problem)
    end
  end

  describe "GET edit" do
    it "assigns the requested problem as @problem" do
      Problem.stub!(:find).with("37").and_return(mock_problem)
      get :edit, :id => "37"
      assigns[:problem].should equal(mock_problem)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created problem as @problem" do
        Problem.stub!(:new).with({'these' => 'params'}).and_return(mock_problem(:save => true))
        post :create, :problem => {:these => 'params'}
        assigns[:problem].should equal(mock_problem)
      end

      it "redirects to the created problem" do
        Problem.stub!(:new).and_return(mock_problem(:save => true))
        post :create, :problem => {}
        response.should redirect_to(problem_url(mock_problem))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved problem as @problem" do
        Problem.stub!(:new).with({'these' => 'params'}).and_return(mock_problem(:save => false))
        post :create, :problem => {:these => 'params'}
        assigns[:problem].should equal(mock_problem)
      end

      it "re-renders the 'new' template" do
        Problem.stub!(:new).and_return(mock_problem(:save => false))
        post :create, :problem => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested problem" do
        Problem.should_receive(:find).with("37").and_return(mock_problem)
        mock_problem.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :problem => {:these => 'params'}
      end

      it "assigns the requested problem as @problem" do
        Problem.stub!(:find).and_return(mock_problem(:update_attributes => true))
        put :update, :id => "1"
        assigns[:problem].should equal(mock_problem)
      end

      it "redirects to the problem" do
        Problem.stub!(:find).and_return(mock_problem(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(problem_url(mock_problem))
      end
    end

    describe "with invalid params" do
      it "updates the requested problem" do
        Problem.should_receive(:find).with("37").and_return(mock_problem)
        mock_problem.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :problem => {:these => 'params'}
      end

      it "assigns the problem as @problem" do
        Problem.stub!(:find).and_return(mock_problem(:update_attributes => false))
        put :update, :id => "1"
        assigns[:problem].should equal(mock_problem)
      end

      it "re-renders the 'edit' template" do
        Problem.stub!(:find).and_return(mock_problem(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested problem" do
      Problem.should_receive(:find).with("37").and_return(mock_problem)
      mock_problem.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the problems list" do
      Problem.stub!(:find).and_return(mock_problem(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(problems_url)
    end
  end

end
