$LOAD_PATH << 'lib'

require 'sinatra'
require 'timeutils/time_now'

configure {
  set :server, :puma
}

class Brahma < Sinatra::Base
  env['TZ'] = 'Asia/Kolkata'

  configure do
    enable :logging
    access_log = File.new("#{settings.root}/../log/access-#{settings.environment}.log", 'a+')
    access_log.sync = true
    use Rack::CommonLogger, access_log
  end

  error_log = ::File.new("#{settings.root}/../log/error-#{settings.environment}.log","a+")
  error_log.sync = true
  before {
    env["rack.errors"] = error_log
  }

  get '/ping' do
    return 'Brahma Lives!!'
  end

  post '/timenow' do
    response.body = Timeutils::TimeNow.in(params[:text])
  end

  run! if app_file == $0
end
