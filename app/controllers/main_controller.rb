class MainController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!, :except => [:index]
  
  layout 'application'
 
  def index
    if authenticate_user!
      redirect_to :controller => :tasks            
      return false 
    end
  end
  
  def profile

  end

end
