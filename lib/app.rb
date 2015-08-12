$LOAD_PATH << 'lib'

require 'sinatra'
require 'timeutils/time_now'

configure {
  set :server, :puma
}

class Brahma < Sinatra::Base
  get '/ping' do
    return 'Brahma Lives!!'
  end

  post '/timenow' do
    response.body = Timeutils::TimeNow.in(params[:text])
  end

  run! if app_file == $0
end
