require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/problems/index.html.erb" do
  include ProblemsHelper

  before(:each) do
    assigns[:problems] = [
      stub_model(Problems,
        :id => "value for id",
        :name => "value for name",
        :source => "value for source"
      ),
      stub_model(Problems,
        :id => "value for id",
        :name => "value for name",
        :source => "value for source"
      )
    ]
  end

  it "renders a list of problems" do
    render
    response.should have_tag("tr>td", "value for id".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for source".to_s, 2)
  end
end
