require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/problems/index.html.erb" do
  include ProblemsHelper

  before(:each) do
    assigns[:problems] = [
      stub_model(Problem,
        :code => "value for code",
        :name => "value for name",
        :source => "value for source",
        :categories => [
          stub_model(Category,
            :name => 'category_test'
          )],
        :level => stub_model(Level,
            :description => 'level_test'
          )
      ),
      stub_model(Problem,
        :code => "value for code",
        :name => "value for name",
        :source => "value for source",
        :categories => []
      )
    ]
  end

  it "renders a list of problems" do
    render
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for source".to_s, 2)
    response.should have_tag("tr>td", "category_test".to_s, 1)
    response.should have_tag("tr>td", "level_test".to_s, 1)
    response.should have_tag("tr>td", "(none)", 2)
  end
end
