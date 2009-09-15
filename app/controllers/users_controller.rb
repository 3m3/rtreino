class UsersController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json

  def create
    create! { root_url }
  end

  def edit
    @user = current_user
    super
  end

  def update
    @user = current_user
    update! { root_url }
  end

  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @users ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
