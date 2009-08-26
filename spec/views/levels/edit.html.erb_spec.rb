require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/levels/edit.html.erb" do
  include LevelsHelper

  before(:each) do
    assigns[:level] = @level = stub_model(Level,
      :new_record? => false,
      :description => "value for description"
    )
  end

  it "renders the edit level form" do
    render

    response.should have_tag("form[action=#{level_path(@level)}][method=post]") do
      with_tag('input#level_description[name=?]', "level[description]")
    end
  end
end
