module DashboardHelper
  def msg(log)
    case log.loggable_type
    when 'Problem'
      problem = Problem.find(log.loggable_id)
      link_to "#{log.action.to_s.capitalize}d a problem with code #{problem.code}", problem_path(problem)  
    when 'Analysis'
      analysis = Analysis.find(log.loggable_id)
      if log.action == 'create'
        link_text = "#{analysis.creator.username} created an analysis for problem #{analysis.problem.code}"
      elsif log.action == 'update'
        if analysis.creator == analysis.updater
          link_text = "#{analysis.updater.username} updated his analysis from problem #{analysis.problem.code}"
        else
          link_text = "#{analysis.updater.username} updated #{analysis.creator.username}'s analysis from problem #{analysis.problem.code}"
        end
      end
      link_to link_text, problem_analysis_path(analysis.problem, analysis)
    when 'Statement'
      statement = Statement.find(log.loggable_id)
      if log.action == 'create'
        link_text = "#{statement.creator.username} created an #{statement.language.abbreviation} statement for problem #{statement.problem.code}"
      else
        link_text = "#{statement.creator.username} updated an #{statement.language.abbreviation} statement for problem #{statement.problem.code}"
      end
      link_to link_text, problem_path(statement.problem)

    when 'Comment'
      comment = Comment.find(log.loggable_id)
      parent = comment
      while parent.commentable_type == "Comment"
        parent = Comment.find(parent.commentable_id)
      end
      analysis = Analysis.find(parent.commentable_id)
      if log.action == 'create'
        link_text = "#{comment.creator.username} commented #{analysis.creator.username}'s analysis from problem #{analysis.problem.code}"
      else
        link_text = "#{comment.updater.username} updated #{comment.creator.username}'s comment from analysis of problem #{analysis.problem.code}"
      end
      link_to link_text, problem_analysis_path(analysis.problem, analysis)
    end
  end
end
