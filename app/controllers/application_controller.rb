
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #index
  get '/articles' do
    @articles = Article.all
    erb :index  
  end

  #new article
  get '/articles/new' do 
    erb :new
  end

  # show/find
  get '/articles/:id' do 
    @articles = Article.find(params[:id])
    erb :show 
  end

  #create new article 
  post '/articles' do
    @articles = Article.create(params)
    redirect "/articles/#{@articles.id}"
  end
  
  #edit article by id
  get '/articles/:id/edit' do 
    @articles = Article.find(params[:id])
    erb :edit 
  end

  # update/save edited article
  patch '/articles/:id' do
    params.delete("_method")
    @articles = Article.find(params[:id])
    @articles.update(params)
    redirect "/articles/#{@articles.id}"
  end

  # delete article by id 
  delete '/articles/:id' do 
    @articles = Article.delete(params[:id])
    redirect "/articles"
  end


end
