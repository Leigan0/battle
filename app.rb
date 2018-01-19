require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/attack'
require './lib/computer_player'


class Battle < Sinatra::Base
  enable :sessions

  helpers do
    def attack_player
      Attack.new.damage(@game.player_under_attack)
      redirect '/attack'
    end

    def player_selector(params)
      if params == ""
        ComputerPlayer.new
      else
        Player.new(params)
      end
    end
  end

  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = player_selector(params[:player_2_name])
    Game.build(player_1, player_2)
    redirect '/play'
  end

  post '/attack' do
    attack_player
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
    attack_player if @game.current_player.is_a?(ComputerPlayer)
    erb :play
  end

  get '/gameover' do
    erb :gameover
  end

  run! if app_file == $0 # adding this allows you to run ruby app.rb within IRB
  #without this you would need to run rackup -p 4567
end
