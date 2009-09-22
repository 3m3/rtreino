class CategoriesController < InheritedResources::Base
  before_filter :login_required
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json


  def create
    create! do |success, failure|
      failure.html { render new_category_path(@category) }
      success.html { redirect_to edit_category_path(@category) }
    end
  end

  def update
    update! { edit_category_path(@category) }
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @categories ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
