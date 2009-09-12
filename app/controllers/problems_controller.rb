class ProblemsController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json

  def create
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
      @problems ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
