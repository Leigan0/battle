require 'sinatra/base'

class Battle < Sinatra::Base
   set :sessions, true

  get '/' do
    'hello battle!!!!!!'
  end

  run! if app_file == $0 # adding this allows you to run ruby app.rb within IRB
  #without this you would need to run rackup -p 4567
end
