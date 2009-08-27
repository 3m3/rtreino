require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/problems/edit.html.erb" do
  include ProblemsHelper

  before(:each) do
    assigns[:problem] = @problem = stub_model(Problem,
      :new_record? => false,
      :code => "value for code",
      :name => "value for name",
      :source => "value for source"
    )
  end

  it "renders the edit problem form" do
    render

    response.should have_tag("form[action=#{problem_path(@problem)}][method=post]") do
      with_tag('input#problem_code[name=?]', "problem[code]")
      with_tag('input#problem_name[name=?]', "problem[name]")
      with_tag('input#problem_source[name=?]', "problem[source]")
    end
  end
end
