class AddressesController < ApplicationController

  def index
    @addresses = Address.all
  end

  def notify
    @notification = Notification.new(body: params[:notification][:body])
    addresses = params[:notification][:addresses]
    addresses.delete_if {|item| item== '' }
    devices = Device.where(id: addresses) unless addresses.length.zero?

    if @notification.save and devices

      logger.debug params.as_json

      devices = devices.map{|a| a.token}

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
    redirect_to addresses_path
  end

end
