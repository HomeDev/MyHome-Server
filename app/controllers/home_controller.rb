class HomeController < ApplicationController

  def index
    @notifications = Notification.all
  end

  def notify
    @notification = Notification.new(body: params[:notification][:body])
    if @notification.save

      logger.debug params.as_json

      devices = Device.all.map{|a| a.token}

      notification = {
          :schedule_for => [1.seconds.from_now],
          :apids => devices,
          :android => {
              :alert => @notification.body, :extra => {:foo => 'bar'}
          }
      }

      response = Urbanairship.push(notification)

      logger.debug response.as_json    
    end
    redirect_to root_path
  end

end
