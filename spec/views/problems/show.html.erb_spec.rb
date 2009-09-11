require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/problems/show.html.erb" do
  include ProblemsHelper
  before(:each) do
    assigns[:problem] = @problem = stub_model(Problem,
      :code => "value for code",
      :name => "value for name",
      :source => "value for source",
      :categories => [
        stub_model(Category,
          :id => 1,
          :name => 'Teste'
        )],
      :level_id => 1,
      :level => stub_model(Level,
          :id => 1,
          :description => 'level_test'
        )
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ code/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ source/)
    response.should have_text(/Teste/)
  end

  it "renders attributes in <p>" do
    assigns[:problem] = @problem = stub_model(Problem,
      :code => "value for code",
      :name => "value for name",
      :source => "value for source",
      :categories => [], 
      :level_id => nil
    )
    render
    response.should have_text(/value\ for\ code/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ source/)
    response.should have_tag("p", /(none)/, 2)
  end

end
