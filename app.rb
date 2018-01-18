require 'sinatra/base'
require './lib/player'
require './lib/game'

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
    @game.attack(@game.player_under_attack)
    @game.switch_turn
    redirect '/play'
  end

  get '/play' do
    @game = $game
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    @player_1_hp = @game.player_1.hit_points
    @player_2_hp = @game.player_2.hit_points
    @current_player_turn = @game.current_player.name
    erb :play
  end

  run! if app_file == $0 # adding this allows you to run ruby app.rb within IRB
  #without this you would need to run rackup -p 4567
end
