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

  get '/gossips/:id' do
    id = params['id']
    "Bonjour, #{params['id']}!"
  end

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
end