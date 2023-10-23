require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new' do
    erb :new_gossip
  end

  post '/gossips/new' do
    author = params[:author]
    content = params[:content]
    Gossip.new(author, content).save
    redirect '/'
  end

  get '/gossips/:id' do
    marina = params[:id].to_i
    @potin = Gossip.all[marina]
    erb :show 
  end
end