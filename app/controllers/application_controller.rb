class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # this code below prevents back button from letting users relog in. 
  
  before_action :authenticate_user!
  before_filter :set_cache_buster
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      view_poems_path
    else
      view_poems_path
    end

  end
  
  def page_not_found
    # respond_to do |format|
    #   format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
    #   format.all  { render nothing: true, status: 404 }
    # end
    get "/admin/404"
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

end
