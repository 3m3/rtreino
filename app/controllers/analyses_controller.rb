class AnalysesController < InheritedResources::Base
  before_filter :login_required
  before_filter :authorize, :except => [:new, :create, :index, :show]
  
  actions :show, :new, :edit, :create, :update
  respond_to :html, :js, :xml, :json
  belongs_to :problem, :finder => :find_by_code!

  def create
    create! do |success, failure|
      success.html do
        if params[:commit] == 'Create and continue'
          redirect_to edit_problem_analysis_path(@problem, @analysis)
        else
          redirect_to problem_analysis_path(@problem, @analysis)
        end
      end
      failure.html { render :new }
    end
  end

  def update
    update! do |success, failure|
      success.html do
        if params[:commit] == 'Update and continue'
          redirect_to edit_problem_analysis_path(@problem, @analysis)
        else
          redirect_to problem_analysis_path(@problem, @analysis)
        end
      end
      failure.html { render :new }
    end
  end

  protected

  def collection
    paginate_options ||= {}
    paginate_options[:page] ||= (params[:page] || 1)
    paginate_options[:per_page] ||= (params[:per_page] || 20)
    @analyses ||= end_of_association_chain.paginate(paginate_options)
  end

  private

  def authorize
    analysis = Analysis.find(params[:id])
    if !current_user.admin? && current_user.id != analysis.creator_id
      flash[:error] = "Unauthorized access!"
      redirect_to edit_problem_path(analysis.problem)
      false
    end
  end
end
