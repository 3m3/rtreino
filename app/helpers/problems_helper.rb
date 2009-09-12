module ProblemsHelper
  
  def level_name_of problem
    if problem.level.nil?
      "(none)"
    else
      problem.level.name
    end
  end

end
