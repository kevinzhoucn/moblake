class ApiController < ApplicationController
  def registeruser
    if params[:device_id]
      device_id = params[:device_id]

      if Member.where(:device_id => device_id).exists?
        user = Member.where(:device_id => device_id).first
        ret = { :result => {:code => "1", :message => "existed user."}, :data => {:user_info => user} }
        render json: ret.to_json

      else
        user = Member.new
        user.device_id = device_id

        if user.save
          u_name = 10000 + user.id 
          if user.update_attributes(:name => u_name.to_s)
            ret = { :result => {:code => "1", :message => "success. create user succeed!"}, :data => {:user_info => user} }
            render json: ret.to_json
          else
            ret = { :result => {:code => "0", :message => "failed, update user name failed."}, :data => {:user_info => user} }
            render json: ret.to_json
          end
        else
          ret = { :result => {:code => "0", :message => "failed, create user failed."}, :data => {:device_id => device_id} }
          render json: ret.to_json
        end
      end
    end
  end

  def getuserinfo
    user_id = params[:user_id]
    if user_id
      if user = Member.where(:id => user_id).first        
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
    points = params[:points]
    price = params[:price]
    member = Member.find(user_id)

    if member
      ret = offer_points(member, points.to_i)
    else
      ret = { :result => {:code => "0", :message => "user not existed."}, :data => {} }
    end
    render json: ret.to_json
  end

  def gettasklist
    user_id = params[:user_id]
    if user_id
      tasks = Task.where(:member_id => user_id)
      ret = { :result => {:code => "1", :message => "success."}, :data => {:task_list => tasks } }
      render json: ret.to_json
    else
      ret = { :result => {:code => "0", :message => "failed, user id is empty."}, :data => {:user_id => ''} }
      render json: ret.to_json
    end
  end

  def getexchangelist
    user_id = params[:user_id]
    exchanges = Exchange.where(:member_id => user_id)
    ret = { :result => {:code => "1", :message => "success."}, :data => {:exchange_list => exchanges} }
    render json: ret.to_json
  end

  def gethometasklist
    home_task_list = HomeTask.all
    ret = { :result => {:code => "1", :message => "success."}, :data => {:home_task_list => home_task_list} }
    render json: ret.to_json
  end

  def checkin
    user_id = params[:user_id]
    task = Task.where(:member_id => user_id, :order_type => 0).last    

    if task
      if Date.parse(task.created_at.to_s) == Date.today
        ret = { :result => {:code => "0", :message => "Already checked in today."}, :data => {} }
        render json: ret.to_json        
      else
        add_checkin_task(user_id)
      end
    else
      add_checkin_task(user_id)
    end
  end

  private
    def add_checkin_task(user_id)
      task = Task.new
      task.order_id = 0    
      task.order_type = 0
      task.member_id = user_id
      task.member_name = user_id
      task.points = 10
      if task.save
        ret = { :result => {:code => "1", :message => "success check in today."}, :data => {:check_task => task} }
        render json: ret.to_json
      else
        ret = { :result => {:code => "0", :message => "failed, create check-in task failed."}, :data => {:user_id => user_id} }
        render json: ret.to_json
      end
    end

    def offer_points(member, points)

      if member.available_points > points
        new_available_points = member.available_points - points
        if member.update_attributes(:available_points => new_available_points)
          record = Exchange.new
          record.member_id = member.id
          record.points = points
          if record.save
            ret = { :result => {:code => "1", :message => "Offer points #{points}, create record exchange!"}, :data => {:exchange => record} }
          else
            ret = { :result => {:code => "0", :message => "Offer points #{points}, create record exchange failed!"}, :data => {} }
          end          
        else
          ret = { :result => {:code => "0", :message => "Update attribute failed!"}, :data => {} }
        end
      else
        ret = { :result => {:code => "0", :message => "No enough money!"}, :data => {} }
      end
    end
end
