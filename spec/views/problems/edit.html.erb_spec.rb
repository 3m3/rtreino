require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/problems/edit.html.erb" do
  include ProblemsHelper

  before(:each) do
    assigns[:problem] = @problem = stub_model(Problem,
      :new_record? => false,
      :code => "value for code",
      :name => "value for name",
      :source => "value for source",
      :categories => [
        stub_model(Category,
          :name => "category name"
        )]
    )
  end

  it "renders the edit problem form" do
    render

    response.should have_tag("form[action=#{problem_path(@problem)}][method=post]") do
      with_tag('input#problem_code[name=?]', "problem[code]")
      with_tag('input#problem_name[name=?]', "problem[name]")
      with_tag('input#problem_source[name=?]', "problem[source]")
      with_tag('select#problem_level_id[name=?]', "problem[level_id]")
    end
    response.should have_tag('select#category_id[name=?]', "category_id")
    response.should have_tag('li', /category name\s+/)
  end
end
