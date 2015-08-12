#!/usr/bin/env ruby

require 'sinatra'

configure {
  set :server, :puma
}

class Brahma < Sinatra::Base
  get '/' do
    return 'Brahma is Created!!'
  end

  run! if app_file == $0
end