require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/problems/new.html.erb" do
  include ProblemsHelper

  before(:each) do
    assigns[:problems] = stub_model(Problems,
      :new_record? => true,
      :id => "value for id",
      :name => "value for name",
      :source => "value for source"
    )
  end

  it "renders new problems form" do
    render

    response.should have_tag("form[action=?][method=post]", problems_path) do
      with_tag("input#problems_id[name=?]", "problems[id]")
      with_tag("input#problems_name[name=?]", "problems[name]")
      with_tag("input#problems_source[name=?]", "problems[source]")
    end
  end
end
