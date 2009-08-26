require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/levels/show.html.erb" do
  include LevelsHelper
  before(:each) do
    assigns[:level] = @level = stub_model(Level,
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ description/)
  end
end
