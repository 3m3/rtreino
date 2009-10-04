class OnlineJudgesController < InheritedResources::Base 
  before_filter :login_required, :except => [ :index, :show ]
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @online_judges ||= end_of_association_chain.paginate(paginate_options)
    end
        
end