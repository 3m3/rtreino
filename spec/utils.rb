def execute_login
  activate_authlogic
  @user = Factory.create(:user, :confirmation_ok => true)
  @user_session = UserSession.create(@user)
end
