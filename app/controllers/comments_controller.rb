class CommentsController < InheritedResources::Base
  before_filter :login_required
  before_filter :authorize, :except => [:new, :create]

  actions :new, :edit, :create, :update
  respond_to :html, :js, :xml, :json

  def new
    @comment = Comment.new
    if params[:analysis_id]
      @comment.commentable_id = params[:analysis_id]
      @comment.commentable_type = 'Analysis'
    elsif params[:comment_id]
      @comment.commentable_id = params[:comment_id]
      @comment.commentable_type = 'Comment'
    end
  end

  def create
    params[:comment][:user_id] = current_user.id
    create! { path_for @comment}
  end

  def update
    update! { path_for @comment }
  end

  protected

  def collection
    paginate_options ||= {}
    paginate_options[:page] ||= (params[:page] || 1)
    paginate_options[:per_page] ||= (params[:per_page] || 20)
    @comments ||= end_of_association_chain.paginate(paginate_options)
  end

  private

  def path_for comment 
    if comment.commentable_type == 'Analysis'
      edit_problem_path(Analysis.find(comment.commentable_id).problem)
    elsif comment.commentable_type == 'Comment'
      path_for Comment.find(comment.commentable_id)
    end
  end

  def authorize
    comment = Comment.find(params[:id])
    if !current_user.admin? && current_user.id != comment.user_id
      flash[:error] = "Unauthorized access!"
      redirect_to root_path
      false
    end
  end

end
