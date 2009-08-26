require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/problems/show.html.erb" do
  include ProblemsHelper
  before(:each) do
    assigns[:problems] = @problems = stub_model(Problems,
      :id => "value for id",
      :name => "value for name",
      :source => "value for source"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ id/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ source/)
  end
end
