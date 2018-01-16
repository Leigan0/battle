require 'sinatra/base'

class Battle < Sinatra::Base
   set :sessions, true

  get '/' do
    erb :index
    # 'Hello Battle!!!!!!'
  end

  post '/names' do
    @player_1_name = params[:player_1_name]
    @player_2_name =  params[:player_2_name]
    p params
    erb :play
  end

  run! if app_file == $0 # adding this allows you to run ruby app.rb within IRB
  #without this you would need to run rackup -p 4567
end
