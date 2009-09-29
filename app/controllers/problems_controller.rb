class ProblemsController < InheritedResources::Base
  before_filter :login_required, :except => [:index, :show]

  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json

  def create
    create! do |success, failure|
      failure.html { render new_problem_path(@problem) }
      success.html { redirect_to edit_problem_path(@problem) }
    end
  end

  def update
    update! { edit_problem_path(@problem) }
  end

  protected

  def collection
    paginate_options ||= {}
    paginate_options[:page] ||= (params[:page] || 1)
    paginate_options[:per_page] ||= (params[:per_page] || 20)
    @problems ||= end_of_association_chain.find(:all, :order => 'source, code').paginate(paginate_options)
    @problems_sources = @problems.group_by { |p| p.source }
  end

  def resource
    @problem ||= end_of_association_chain.find_by_code(params[:id])
  end

end
