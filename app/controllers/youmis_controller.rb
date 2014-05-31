class YoumisController < ApplicationController
  before_filter :authenticate_admin!

  # GET /youmis
  # GET /youmins.json
  def index
    @youmies = Youmi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @youmi }
    end
  end

  # GET /youmi/1
  # GET /youmi/1.json
  def show
    @youmi = Youmi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @youmi }
    end
  end

  # GET /youmi/new
  # GET /youmi/new.json
  def new
    @youmi = Youmi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @youmi }
    end
  end

  # GET /youmi/1/edit
  def edit
    @youmi = Youmi.find(params[:id])
  end

  # POST /youmi
  # POST /youmi.json
  def create
    @youmi = Youmi.new(params[:youmi])

    respond_to do |format|
      if @youmi.save
        format.html { redirect_to @youmi, notice: 'youmi was successfully created.' }
        format.json { render json: @youmi, status: :created, location: @youmi }
      else
        format.html { render action: "new" }
        format.json { render json: @youmi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /youmi/1
  # PUT /youmi/1.json
  def update
    @youmi = Youmi.find(params[:id])

    respond_to do |format|
      if @youmi.update_attributes(params[:youmi])
        format.html { redirect_to @youmi, notice: 'youmi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @youmi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youmi/1
  # DELETE /youmi/1.json
  def destroy
    @youmi = Youmi.find(params[:id])
    @youmi.destroy

    respond_to do |format|
      format.html { redirect_to youmi_url }
      format.json { head :no_content }
    end
  end
end
