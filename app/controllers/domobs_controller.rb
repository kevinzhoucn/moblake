class DomobsController < ApplicationController
  # GET /domobs
  # GET /domobs.json
  def index
    @domobs = Domob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @domobs }
    end
  end

  # GET /domobs/1
  # GET /domobs/1.json
  def show
    @domob = Domob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @domob }
    end
  end

  # GET /domobs/new
  # GET /domobs/new.json
  def new
    @domob = Domob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @domob }
    end
  end

  # GET /domobs/1/edit
  def edit
    @domob = Domob.find(params[:id])
  end

  # POST /domobs
  # POST /domobs.json
  def create
    @domob = Domob.new(params[:domob])

    respond_to do |format|
      if @domob.save
        format.html { redirect_to @domob, notice: 'Domob was successfully created.' }
        format.json { render json: @domob, status: :created, location: @domob }
      else
        format.html { render action: "new" }
        format.json { render json: @domob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /domobs/1
  # PUT /domobs/1.json
  def update
    @domob = Domob.find(params[:id])

    respond_to do |format|
      if @domob.update_attributes(params[:domob])
        format.html { redirect_to @domob, notice: 'Domob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @domob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domobs/1
  # DELETE /domobs/1.json
  def destroy
    @domob = Domob.find(params[:id])
    @domob.destroy

    respond_to do |format|
      format.html { redirect_to domobs_url }
      format.json { head :no_content }
    end
  end
end
