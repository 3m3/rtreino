require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/levels/new.html.erb" do
  include LevelsHelper

  before(:each) do
    assigns[:level] = stub_model(Level,
      :new_record? => true,
      :description => "value for description"
    )
  end

  it "renders new level form" do
    render

    response.should have_tag("form[action=?][method=post]", levels_path) do
      with_tag("input#level_description[name=?]", "level[description]")
      with_tag("input#level_difficult_value[name=?]", "level[difficult_value]")
    end
  end
end
