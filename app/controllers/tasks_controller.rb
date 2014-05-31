class TasksController < ApplicationController
  before_filter :authenticate_admin!, :skip => [youmitask]

  def index
    @tasks = Task.all
    @tasks_reviewed = Task.has_reviewed
    @tasks_pending = Task.pending_reviewed
  end

  def youmitask
    @youmitasks = Youmi.all
  end

  def reviewed
    @tasks_reviewed = Task.has_reviewed
  end

  def update
    item = Task.find(params[:id])
#    item.update_attributes(params[:task_item])
    item.update_attributes(:reviewed => true)
    
    render nothing: true
  end

  def check_reviewed
    item = Task.find(params[:id])
    item.update_attributes(:reviewed => true)

    render nothing: true
  end

  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to root_url, notice: t('.created_task_successfully') }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end  

  # protected
  #   def authenticate_admin!
  #     if not current_admin
  #       redirect_to new_admin_session_path
  #     end
  #   end
end
