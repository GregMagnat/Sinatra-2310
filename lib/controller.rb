require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
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
end