class DashboardController < ApplicationController
  def index
    paginate_options ||= {}
    paginate_options[:page] ||= (params[:page] || 1)
    paginate_options[:per_page] ||= (params[:per_page] || 50)
    @logs = LogModel.find(:all, :order => 'created_at DESC').paginate(paginate_options)
  end
end
