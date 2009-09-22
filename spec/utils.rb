def execute_login
  activate_authlogic
  @user = Factory.create(:user, :confirmation_ok => true)
  UserSession.create @user
end
