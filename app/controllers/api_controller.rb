class ApiController < ApplicationController
  def registeruser
    device_id = params[:device_id]
    id = params[:id]
    ret = { :result => {:code => "1", :message => "success"}, :data => {:device_id => device_id, :id => id} }
    render json: ret.to_json
  end

  def getuserinfo
  end

  def exchange
  end

  def gettasklist
  end

  def getexchangelist
  end

  def checkin
  end
end
