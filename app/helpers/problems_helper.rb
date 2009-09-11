module ProblemsHelper
  def level_description_of problem
    if problem.level.nil?
      "(none)"
    else
      problem.level.description
    end
  end

  def categories_list problem
    c = Category.find(:all).map { |c| [c.name, c.id] }
    c.delete_if { |c| problem.categories.exists? c[1] }
  end
end
