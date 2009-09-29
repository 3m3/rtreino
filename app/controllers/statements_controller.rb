class StatementsController < InheritedResources::Base
  before_filter :login_required
  actions :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  belongs_to :problem, :finder => :find_by_code!
  
  def create
    create! { edit_problem_path(@problem) }
  end

  def update
    update! { edit_problem_path(@problem) }
  end

  def destroy
    destroy! { edit_problem_path(@problem) }
  end

  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @statements ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
