require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/problems/new.html.erb" do
  include ProblemsHelper

  before(:each) do
    assigns[:problem] = stub_model(Problem,
      :new_record? => true,
      :id => "value for id",
      :name => "value for name",
      :source => "value for source"
    )
  end

  it "renders new problem form" do
    render

    response.should have_tag("form[action=?][method=post]", problems_path) do
      with_tag("input#problem_id[name=?]", "problem[id]")
      with_tag("input#problem_name[name=?]", "problem[name]")
      with_tag("input#problem_source[name=?]", "problem[source]")
    end
  end
end
