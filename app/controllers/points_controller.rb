class PointsController < ApplicationController
  before_filter :authenticate_admin!

  # GET /points/youmicallback
  def youmicallback
    @youmi = Youmi.new

    @youmi.order = params[:order]
    @youmi.app = params[:app]
    @youmi.ad = params[:ad]
    @youmi.adid = params[:adid]
    @youmi.user = params[:user]
    @youmi.device = params[:device]
    @youmi.chn = params[:chn]
    @youmi.price = params[:price]
    @youmi.points = params[:points]
    @youmi.time = params[:time]
    @youmi.sig = params[:sig]
    @youmi.sign = params[:sign]
    @youmi.source = ''

    if @youmi.save
      redirect_to youmi_tasks_path
    end
  end
end
