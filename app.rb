require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/attack'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  post '/attack' do
    @game = $game
    Attack.new.attack($game.player_under_attack)
    p @game.player_1.hit_points
    p @game.player_2.hit_points
    redirect '/attack'
  end

  get '/attack' do
    @game = $game
    erb :attack
  end

  post '/switch_turn' do
    $game.switch_turn
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  run! if app_file == $0 # adding this allows you to run ruby app.rb within IRB
  #without this you would need to run rackup -p 4567
end
