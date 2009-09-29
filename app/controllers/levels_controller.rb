class LevelsController < InheritedResources::Base
  before_filter :login_required, :except => :index
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json

  def create
    create! do |success, failure|
      failure.html { render new_level_path(@level) }
      success.html { redirect_to edit_level_path(@level) }
    end
  end

  def update
    update! { edit_level_path(@level) }
  end

  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @levels ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
