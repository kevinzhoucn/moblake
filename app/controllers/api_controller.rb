class ApiController < ApplicationController
  def registeruser
    if params[:device_id]
      device_id = params[:device_id]

      member = Member.new
      member.device_id = device_id

      if member.save
        ret = { :result => {:code => "1", :message => "success."}, :data => {:device_id => device_id, :id => member.id} }
        render json: ret.to_json
      else
        ret = { :result => {:code => "0", :message => "failed, create member failed."}, :data => {:device_id => device_id} }
        render json: ret.to_json
      end
    end
  end

  def getuserinfo
    user_id = params[:user_id]
    if user_id
      user = Member.find(user_id)
      if user
        ret = { :result => {:code => "1", :message => "success."}, :data => {:user_info => user } }
        render json: ret.to_json
      else
        ret = { :result => {:code => "0", :message => "failed, no user found."}, :data => {:user_id => params[:id]} }
        render json: ret.to_json
      end
    else
      ret = { :result => {:code => "0", :message => "failed, user id is empty."}, :data => {:user_id => ''} }
      render json: ret.to_json
    end    
  end

  def exchange
    user_id = params[:user_id]
    ret = { :result => {:code => "1", :message => "success."}, :data => {:id => member.id} }
    render json: ret.to_json
  end

  def gettasklist
    user_id = params[:user_id]
    if user_id
      tasks = Task.where(:member_id => user_id)
      ret = { :result => {:code => "1", :message => "success."}, :data => {:task_list => tasks.to_json } }
      render json: ret.to_json
    else
      ret = { :result => {:code => "0", :message => "failed, user id is empty."}, :data => {:user_id => ''} }
      render json: ret.to_json
    end
  end

  def getexchangelist
    user_id = params[:user_id]
  end

  def checkin
    user_id = params[:user_id]
  end
end
