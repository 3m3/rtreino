module DashboardHelper
  def msg(log)
    case log.loggable_type
    when 'Problem'
      problem = Problem.find(log.loggable_id)
      link_to "#{log.action.to_s.capitalize}d a problem with code #{problem.code}", problem_path(problem)  
    when 'Analysis'
      analysis = Analysis.find(log.loggable_id)
      if log.action == 'create'
        link_text = "#{analysis.user.username} created an analysis for problem #{analysis.problem.code}"
      elsif log.action == 'update'
        link_text = "#{analysis.user.username} updated your analysis from problem #{analysis.problem.code}"
      end

      link_to link_text, problem_analysis_path(analysis.problem, analysis)
    end
  end
end
