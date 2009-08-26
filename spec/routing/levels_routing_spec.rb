require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LevelsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "levels", :action => "index").should == "/levels"
    end

    it "maps #new" do
      route_for(:controller => "levels", :action => "new").should == "/levels/new"
    end

    it "maps #show" do
      route_for(:controller => "levels", :action => "show", :id => "1").should == "/levels/1"
    end

    it "maps #edit" do
      route_for(:controller => "levels", :action => "edit", :id => "1").should == "/levels/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "levels", :action => "create").should == {:path => "/levels", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "levels", :action => "update", :id => "1").should == {:path =>"/levels/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "levels", :action => "destroy", :id => "1").should == {:path =>"/levels/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/levels").should == {:controller => "levels", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/levels/new").should == {:controller => "levels", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/levels").should == {:controller => "levels", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/levels/1").should == {:controller => "levels", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/levels/1/edit").should == {:controller => "levels", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/levels/1").should == {:controller => "levels", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/levels/1").should == {:controller => "levels", :action => "destroy", :id => "1"}
    end
  end
end
