class HomeTasksController < ApplicationController
  # GET /home_tasks
  # GET /home_tasks.json
  def index
    @home_tasks = HomeTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @home_tasks }
    end
  end

  # GET /home_tasks/1
  # GET /home_tasks/1.json
  def show
    @home_task = HomeTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @home_task }
    end
  end

  # GET /home_tasks/new
  # GET /home_tasks/new.json
  def new
    @home_task = HomeTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @home_task }
    end
  end

  # GET /home_tasks/1/edit
  def edit
    @home_task = HomeTask.find(params[:id])
  end

  # POST /home_tasks
  # POST /home_tasks.json
  def create
    @home_task = HomeTask.new(params[:home_task])

    respond_to do |format|
      if @home_task.save
        format.html { redirect_to @home_task, notice: 'Home task was successfully created.' }
        format.json { render json: @home_task, status: :created, location: @home_task }
      else
        format.html { render action: "new" }
        format.json { render json: @home_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /home_tasks/1
  # PUT /home_tasks/1.json
  def update
    @home_task = HomeTask.find(params[:id])

    respond_to do |format|
      if @home_task.update_attributes(params[:home_task])
        format.html { redirect_to @home_task, notice: 'Home task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @home_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_tasks/1
  # DELETE /home_tasks/1.json
  def destroy
    @home_task = HomeTask.find(params[:id])
    @home_task.destroy

    respond_to do |format|
      format.html { redirect_to home_tasks_url }
      format.json { head :no_content }
    end
  end
end
