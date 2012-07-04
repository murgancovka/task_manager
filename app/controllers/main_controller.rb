class MainController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!, :except => :index

  def index
	if authenticate_user!
	  redirect_to :controller => :tasks            
      return false 
    end
  end

=begin
  def index
	if authenticate_user!
		redirect_to :controller => :tasks            
        return false 
	else
		render :text => "ASD :("
	end
  end
=end

end
