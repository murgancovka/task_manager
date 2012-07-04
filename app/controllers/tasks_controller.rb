class TasksController < ActionController::Base
  protect_from_forgery

  layout 'application'

  before_filter :authenticate_user!

  load_and_authorize_resource

  def index
    @task=Task.find(:first, :conditions=>["id=2"])
  end

  def new
    @task = Task.new
    if request.post?
      if params[:commit]=="Create Task" 
	@task = Task.new(params[:task])
	@task.user_id = current_user.id
	@task.is_done = false
	if @task.save
	  flash[:notice] = "Added new Task!"
	  redirect_to :action => :show, :id => @task.id
	  return false
	end
      else
	redirect_to :action => :index
      end
    end
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def update
    task=Task.find(params[:id])
    if params[:commit]=="Check as done" 
      task.is_done=true
      flash[:notice] = "Task is done!"
    elsif params[:commit]=="Edit"
      redirect_to :action => :edit, :id => task.id
      return false
    elsif params[:commit]=="Cancel task"
      task.is_cancel = true
      flash[:notice] = "Task is cancel, you always can do this task again in your settings"
    end
    task.save
    redirect_to :action => :show, :id => task.id
    return false
  end

end
