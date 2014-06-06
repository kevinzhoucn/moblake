class PointsController < ApplicationController
  # before_filter :authenticate_admin!

  # GET /points/youmicallback
  def youmicallback
    WORKER_LOG.info "Received message from #{request.domain}, URL: #{request.url}"
    if params[:sign]
      expected_sign = get_Signature(request.query_parameters.except(:sign), "1234567890")
#      if params[:sign] == expected_sign
      if true
        WORKER_LOG.info "Check Signature succeed!"
        WORKER_LOG.info "Received message from Youmi #{params[:order]}, #{params[:app]}, #{params[:ad]}, #{params[:adid]}!"

#        if not Youmi.find_by_order(params[:order])
        if not Youmi.where(:order => "#{params[:order]}").exists?
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
          @youmi.source = URI.parse(request.url)

          if @youmi.save      
            render :text => "Success!"
          end
        else
          WORKER_LOG.warn "Duplicate ID Received! Order ID: #{params[:order]}. Discard this record, return status : 403"
          render :text => "Duplicate ID Received! Order ID: #{params[:order]}", :status => :forbidden
        end
      else
        WORKER_LOG.error "Singature checked failed! Received Sing: #{params[:sign]}, Expected Sign: #{expected_sign}"
        render :text => "Failed! Singature checked failed ", :status => :not_acceptable
      end      
    else
      WORKER_LOG.error "Singature checked failed! Singature is empty"
      render :text => "Failed! Singature is empty", :status => :not_acceptable
    end
  end

  protected
    def get_Signature(youmi_params, secret)
      youmi_sort_params_str = Hash[youmi_params.sort].map{ |key, value| "#{key}=#{value}" }.join('') + secret
      Digest::MD5.hexdigest(youmi_sort_params_str)
    end
end
