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
    Game.create(player_1, player_2)
    redirect '/play'
  end

  post '/attack' do
    Attack.new.attack(Game.instance.player_under_attack)
    redirect '/attack'
  end

  get '/attack' do
    @game = Game.instance
    erb :attack
  end

  post '/switch_turn' do
    @game = Game.instance
    @game.switch_turn
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    redirect '/gameover' if @game.gameover?
    erb :play
  end

  get '/gameover' do
    @game = Game.instance
    erb :gameover
  end

  run! if app_file == $0 # adding this allows you to run ruby app.rb within IRB
  #without this you would need to run rackup -p 4567
end
