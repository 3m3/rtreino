require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/levels/index.html.erb" do
  include LevelsHelper

  before(:each) do
    assigns[:levels] = [
      stub_model(Level,
        :description => "value for description"
      ),
      stub_model(Level,
        :description => "value for description"
      )
    ]
  end

  it "renders a list of levels" do
    render
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
