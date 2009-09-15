class UsersController < InheritedResources::Base 
  before_filter :login_required, :except => [ :index, :new, :create ] 
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json

  def create
    delete_dangerous_params!
    create! { root_url }
  end

  def edit
    unless current_user.admin?
      @user = current_user
    else
      if params[:id] == "current"
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end 
    super
  end

  def update
    unless current_user.admin?
      delete_dangerous_params!
      @user = current_user
    end
    update! { root_url }
  end

  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @users ||= end_of_association_chain.paginate(paginate_options)
    end

  private 

  def delete_dangerous_params!
    params[:user].delete :confirmation_ok
    params[:user].delete :admin
  end
end
