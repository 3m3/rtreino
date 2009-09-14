class AnalysesController < InheritedResources::Base
  
  actions :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  belongs_to :problem

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
      @analyses ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
