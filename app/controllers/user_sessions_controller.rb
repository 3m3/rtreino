class UserSessionsController < InheritedResources::Base
  
  actions :new, :create, :destroy
  respond_to :html, :js, :xml, :json
 
  def create
    create! { root_url }
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Succefully logged out."
    redirect_to root_url
  end

  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @user_sessions ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
