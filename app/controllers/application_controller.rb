require_relative "../../config/environment.rb"
require_relative "../models/fweet.rb"
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
    @fweets = Array.new
    @fweets = Fweet.all
    # Fweet.delete_all
    erb :index
  end
  
  post '/' do
    Fweet.create(:user => params[:user], :content => params[:fweet])
    @fweets = Fweet.all
    erb :index
  end


  
end