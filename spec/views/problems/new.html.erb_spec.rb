require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/problems/new.html.erb" do
  include ProblemsHelper

  before(:each) do
    assigns[:problem] = stub_model(Problem,
      :new_record? => true,
      :code => "value for code",
      :name => "value for name",
      :source => "value for source",
      :categories => []
    )
  end

  it "renders new problem form" do
    render

    response.should have_tag("form[action=?][method=post]", problems_path) do
      with_tag("input#problem_code[name=?]", "problem[code]")
      with_tag("input#problem_name[name=?]", "problem[name]")
      with_tag("input#problem_source[name=?]", "problem[source]")
      with_tag("select#problem_level_id[name=?]", "problem[level_id]")
    end
  end
end
