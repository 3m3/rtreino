class CategoriesController < InheritedResources::Base
  before_filter :login_required
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @categories ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
