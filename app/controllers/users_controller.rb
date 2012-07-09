class UsersController < ActionController::Base
  protect_from_forgery

  def sign_in
  end

  def sign_out
	redirect_to :controller => :tasks            
    return false 
  end
  
  def profile
    
  end

end
