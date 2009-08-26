require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProblemsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "problems", :action => "index").should == "/problems"
    end

    it "maps #new" do
      route_for(:controller => "problems", :action => "new").should == "/problems/new"
    end

    it "maps #show" do
      route_for(:controller => "problems", :action => "show", :id => "1").should == "/problems/1"
    end

    it "maps #edit" do
      route_for(:controller => "problems", :action => "edit", :id => "1").should == "/problems/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "problems", :action => "create").should == {:path => "/problems", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "problems", :action => "update", :id => "1").should == {:path =>"/problems/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "problems", :action => "destroy", :id => "1").should == {:path =>"/problems/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/problems").should == {:controller => "problems", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/problems/new").should == {:controller => "problems", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/problems").should == {:controller => "problems", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/problems/1").should == {:controller => "problems", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/problems/1/edit").should == {:controller => "problems", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/problems/1").should == {:controller => "problems", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/problems/1").should == {:controller => "problems", :action => "destroy", :id => "1"}
    end
  end
end
