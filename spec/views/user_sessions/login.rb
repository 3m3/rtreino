require File.dirname(__FILE__) + '/../../spec_helper'

describe "login page" do
  include UserSessionsHelper

  before :each do 
    activate_authlogic
    @user_session = UserSession.new
    assigns[:user_session] = @user_session
  end

  it "renders login form" do
    render 'user_sessions/new.html.haml'
    response.should have_tag("form[action=#{user_sessions_path}][method=post]") do
      with_tag 'input#user_session_username[name=?]', 'user_session[username]'
      with_tag 'input#user_session_password[name=?]', 'user_session[password]'
      with_tag 'input#user_session_submit[name=?]', 'commit'
    end
  end

end
