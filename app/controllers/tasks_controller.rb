class TasksController < ActionController::Base
  protect_from_forgery

  layout 'application'
  

  before_filter :authenticate_user!

  load_and_authorize_resource

  def index
    offset = rand(Task.important.count)
    @task = Task.first(:offset => offset, :conditions => ["is_done !=true"])
    @tasks = Task.paginate(:order => "created_at desc", :page=>params[:page], :per_page => 6, :conditions => ["user_id=?",current_user.id])
  end

  def new	
    @task = Task.new
    if request.post?
      if params[:commit]=="Create Task"
	today = Time.now().strftime("%y-%m-%d")
	if params[:task][:deadline] == today or params[:task][:deadline] < today
	  @task = Task.new(params[:task])
	  @task.user_id = current_user.id
	  @task.is_done = false
	  if @task.save
	    flash[:notice] = "Added new Task!"
	      redirect_to :action => :show, :id => @task.id
	      return false
	  end
	end
      else
	redirect_to :action => :index
      end
    end
  end

  def show
    @task = Task.find(params[:id])
    authorize! :read, @article
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

  def done_tasks
    @tasks = Task.paginate(:order => "created_at desc", :page=>params[:page], :per_page => 6, :conditions => ["user_id=? and is_done=true",current_user.id])
  end
  
  def all_tasks
    @tasks = Task.paginate(:order => "created_at desc", :page=>params[:page], :per_page => 20, :conditions => ["user_id=?",current_user.id])
  end
  
  def later
    @tasks = Task.paginate(:order => "created_at desc", :page=>params[:page], :per_page => 20, :conditions => ["user_id=? and is_cancel=true",current_user.id])
  end

  def destroy
   @task = Task.find(params[:id])
   if @task.destroy
    flash[:notice] = "Deleted!"
    redirect_to :action => :done_tasks
    return false
   end
  end

end
