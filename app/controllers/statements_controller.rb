class StatementsController < InheritedResources::Base
  before_filter :login_required
  actions :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  belongs_to :problem, :finder => :find_by_code!
  
  def create
    create! do |success, failure|
      success.html do 
        if params[:commit] == "Create and continue"
          redirect_to edit_problem_statement_path(@problem, @statement)
        else
          redirect_to problem_path(@problem)
        end
      end
      failure.html { render :new }
    end
  end

  def update
    update! do |success, failure|
      success.html do
        if params[:commit] == "Update and continue"
          redirect_to edit_problem_statement_path(@problem, @statement)
        else
          redirect_to problem_path(@problem)
        end
      end
    end
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
