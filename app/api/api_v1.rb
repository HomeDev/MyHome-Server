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
    requires :token, type: String, desc: 'Your token.'
  end
  put :auth do
    device = Device.find_or_create_by_token!(params[:token])
    if device
      { status: 'success' }
    else
      { status: 'failure' }
    end    
  end

  params do
    requires :token, type: String, desc: 'Device token.'
    requires :values, type: Hash, :desc => 'Values.'
  end
  post :update do
    authenticate!
    params.as_json
  end

  resource :system do
    desc 'Returns pong.'
    get :ping do
      { :ping => 'pong'}
    end
  end
end