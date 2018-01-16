require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index

  end

  post '/names' do
    @player_1_name = params[:player_1_name]
    @player_2_name =  params[:player_2_name]
    session[:names] = @player_1_name, @player_2_name
    redirect '/play'
  end

  get '/play' do
    @player_1_name, @player_2_name = session[:names]
    erb :play 
  end

  run! if app_file == $0 # adding this allows you to run ruby app.rb within IRB
  #without this you would need to run rackup -p 4567
end
