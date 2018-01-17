require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index

  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    session[:player_1_hp] = 100
    session[:player_2_hp] = 100
    redirect '/play'
  end

  post '/attack' do
    session[:player_2_hp] -= 20
    redirect '/play'
  end

  get '/play' do
    @player_1_hp = session[:player_1_hp]
    @player_2_hp = session[:player_2_hp]
    erb :play
  end

  run! if app_file == $0 # adding this allows you to run ruby app.rb within IRB
  #without this you would need to run rackup -p 4567
end
