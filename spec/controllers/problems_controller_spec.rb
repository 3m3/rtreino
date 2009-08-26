require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProblemsController do

  def mock_problems(stubs={})
    @mock_problems ||= mock_model(Problems, stubs)
  end

  describe "GET index" do
    it "assigns all problems as @problems" do
      Problems.stub!(:find).with(:all).and_return([mock_problems])
      get :index
      assigns[:problems].should == [mock_problems]
    end
  end

  describe "GET show" do
    it "assigns the requested problems as @problems" do
      Problems.stub!(:find).with("37").and_return(mock_problems)
      get :show, :id => "37"
      assigns[:problems].should equal(mock_problems)
    end
  end

  describe "GET new" do
    it "assigns a new problems as @problems" do
      Problems.stub!(:new).and_return(mock_problems)
      get :new
      assigns[:problems].should equal(mock_problems)
    end
  end

  describe "GET edit" do
    it "assigns the requested problems as @problems" do
      Problems.stub!(:find).with("37").and_return(mock_problems)
      get :edit, :id => "37"
      assigns[:problems].should equal(mock_problems)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created problems as @problems" do
        Problems.stub!(:new).with({'these' => 'params'}).and_return(mock_problems(:save => true))
        post :create, :problems => {:these => 'params'}
        assigns[:problems].should equal(mock_problems)
      end

      it "redirects to the created problems" do
        Problems.stub!(:new).and_return(mock_problems(:save => true))
        post :create, :problems => {}
        response.should redirect_to(problem_url(mock_problems))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved problems as @problems" do
        Problems.stub!(:new).with({'these' => 'params'}).and_return(mock_problems(:save => false))
        post :create, :problems => {:these => 'params'}
        assigns[:problems].should equal(mock_problems)
      end

      it "re-renders the 'new' template" do
        Problems.stub!(:new).and_return(mock_problems(:save => false))
        post :create, :problems => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested problems" do
        Problems.should_receive(:find).with("37").and_return(mock_problems)
        mock_problems.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :problems => {:these => 'params'}
      end

      it "assigns the requested problems as @problems" do
        Problems.stub!(:find).and_return(mock_problems(:update_attributes => true))
        put :update, :id => "1"
        assigns[:problems].should equal(mock_problems)
      end

      it "redirects to the problems" do
        Problems.stub!(:find).and_return(mock_problems(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(problem_url(mock_problems))
      end
    end

    describe "with invalid params" do
      it "updates the requested problems" do
        Problems.should_receive(:find).with("37").and_return(mock_problems)
        mock_problems.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :problems => {:these => 'params'}
      end

      it "assigns the problems as @problems" do
        Problems.stub!(:find).and_return(mock_problems(:update_attributes => false))
        put :update, :id => "1"
        assigns[:problems].should equal(mock_problems)
      end

      it "re-renders the 'edit' template" do
        Problems.stub!(:find).and_return(mock_problems(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested problems" do
      Problems.should_receive(:find).with("37").and_return(mock_problems)
      mock_problems.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the problems list" do
      Problems.stub!(:find).and_return(mock_problems(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(problems_url)
    end
  end

end
