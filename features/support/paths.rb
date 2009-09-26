module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the new problem page/
      new_problem_path    
    when /the edit problem page/
      edit_problem_path
    when /the edit page of some problem that has only one analysis with one comment/
      @comment = Factory.create(:comment_from_analysis)
      @analysis = @comment.commentable
      @problem = @analysis.problem
      edit_problem_path(@problem)
    when /the edit page of some problem that has only one analysis that I commented/
      @comment = Factory.create(:comment_from_analysis, :user => @user)
      @analysis = @comment.commentable
      @problem = @analysis.problem
      edit_problem_path(@problem)
    when /the edit page of some problem that has only one analysis/
      @analysis = Factory.create(:analysis)
      @problem = @analysis.problem
      edit_problem_path(@problem)
    when /the edit page of some problem/
      @problem = Factory.create(:problem)
      edit_problem_path(@problem)
    when /the homepage/
      '/'
    when /the new comment page/
      new_comment_path
    when /the new comment of analysis page/
      new_analysis_comment_path
    when /the new comment of comment page/
      new_comment_comment_path
    when /the new analysis page/
      new_analysis_path

    when /the new statement page/
      new_statement_path
    when /the new statement of problem page/
      new_problem_statement_path(@problem)
    when /the edit statement of problem page/
      @statement = Factory.create(:statement)
      @problem = @statement.problem
      edit_problem_statement_path(@problem, @statement)
    when /the new analysis of problem page/
      new_problem_analysis_path(@problem)
    when /the edit my analysis of problem page/
      @analysis = Factory.create(:analysis, :user => @user)
      @problem = @analysis.problem
      edit_problem_analysis_path(@problem, @analysis)
    when /the languages page/
      languages_path
    when /the new language page/
      new_language_path
    when /the edit language page/
      edit_language_path
    when /the new level page/
      new_level_path
    when /the edit level page/
      edit_level_path
    when /the levels page/
      levels_path
    when /the new user_session page/
      new_user_session_path
    when /the new category page/
      new_category_path
    when /the edit category page/
      edit_category_path
    when /login page/
      login_path

    
    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
