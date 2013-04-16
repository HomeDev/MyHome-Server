class API_v1 < Grape::API
  version 'v1', :using => :path, :vendor => 'acme', :format => :json

  helpers do
    def current_user
      @current_user ||= Device.where(token: params[:token]).first
    end

    def authenticate!
      error!('401 Unauthorized', 401) unless current_user
    end
  end

  params do
    requires :token, type: String, desc: 'Your name.'
  end
  put :auth do
    device = Device.create!(token: params[:token])
    { :device => device.id }
  end
  resource :system do
    desc 'Returns pong.'
    get :ping do
      { :ping => 'pong'}
    end
  end
end