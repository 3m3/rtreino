class LanguagesController < InheritedResources::Base
  before_filter :login_required, :except => [:index, :show]

  actions :index, :show, :new, :edit, :create, :update
  respond_to :html, :js, :xml, :json

  def create
    create! do |success, failure|
      failure.html { render new_language_path(@language) }
      success.html { redirect_to edit_language_path(@language) }
    end
  end

  def update
    update! { edit_language_path(@language) }
  end

  protected

  def collection
    paginate_options ||= {}
    paginate_options[:page] ||= (params[:page] || 1)
    paginate_options[:per_page] ||= (params[:per_page] || 20)
    @languages ||= end_of_association_chain.paginate(paginate_options)
  end

end
