class AnalysesController < InheritedResources::Base
  before_filter :login_required
  before_filter :authorize, :except => [:new, :create]
  
  actions :show, :new, :edit, :create, :update
  respond_to :html, :js, :xml, :json
  belongs_to :problem

  def create
    params[:analysis][:user_id] = current_user.id
    create! { edit_problem_path(@problem) }
  end

  def update
    update! { edit_problem_path(@problem) }
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
    if not current_user.admin? && current_user.id != analysis.user_id
      flash[:error] = "Unauthorized access!"
      redirect_to edit_problem_path(analysis.problem)
      false
    end
  end

end
