class HomeController < ApplicationController

  def index
    @notifications = Notification.all
  end

  def notify
    @notification = Notification.new(body: params[:notification][:body])
    if @notification.save

      logger.debug params.as_json
      logger.debug @notification.body

      #Urbanairship.register_device('DEVICE-TOKEN')

      notification = {
          :schedule_for => [1.seconds.from_now],
          :apids => ['9d3553c4-7369-40d0-9d4e-3c42cb18520d', '7b756d8f-001d-4009-8701-3f645991d528'],
          :android => {
              :alert => @notification.body, :extra => {:foo => 'bar'}
          }
      }

        #notify_all(@notification.body)
      response = Urbanairship.push(notification)
      logger.debug response.as_json

    #Urbanairship.register_device('7b756d8f-001d-4009-8701-3f645991d528', :provider => :android)
      #render json: params.as_json
    end
    redirect_to root_path
  end

private

end
