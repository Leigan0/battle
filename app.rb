require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/attack'
require './lib/computer_player'


class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    (params[:player_2_name]) == "" ? player_2 = ComputerPlayer.new : player_2 = Player.new(params[:player_2_name])
    Game.build(player_1, player_2)
    redirect '/play'
  end

  post '/attack' do
    Attack.new.damage(@game.player_under_attack)
    redirect '/attack'
  end

  get '/attack' do
    erb :attack
  end

  post '/switch_turn' do
    @game.switch_turn
    redirect '/play'
  end

  get '/play' do
    redirect '/gameover' if @game.gameover?
    if @game.current_player.is_a?(ComputerPlayer)
      Attack.new.damage(@game.player_under_attack)
      redirect '/attack'
    end
    erb :play
  end

  get '/gameover' do
    erb :gameover
  end

  run! if app_file == $0 # adding this allows you to run ruby app.rb within IRB
  #without this you would need to run rackup -p 4567
end
